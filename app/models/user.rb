class User < ApplicationRecord
  # encrypts :password
  before_save :encrypt_password #, on: :create
  attr_accessor :password

  validates :name, presence: true
  validates :email, { presence: true, uniqueness: true }
  validates :password, confirmation: true, if: :password_required?

  has_many :wines

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest pass+salt
  end

  def encrypt_password
    return if password.blank?
    if self.new_record?
      self.salt = SecureRandom.base64(16)
    end
    self.encrypted_password = User.encrypt(password, salt)
  end

  def self.authenticate(email, pass)
    user = User.where(email: email).take
    user && user.authenticated?(pass) ? user : nil
  end

  def authenticated?(pass)
    self.encrypted_password == User.encrypt(pass, self.salt)
  end

  def password_required?
    self.new_record? || !self.password.blank?
  end
end
