require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do # def test_the_truth
    assert true
  end

  test "cannot save user without name" do
    u = User.new
    assert_not u.save, "Houston, we have a problem"
  end

  test "cannot save user without email address" do
    u = User.new name: "Hello"
    assert_not u.save, "Houston, we have a problem"
  end

  test "cannot save user with existing email address" do
    u = User.new name: "Hello", password: 'titok', email: users(:one).email
    assert_not u.save, "Houston, we have a problem"
  end

  test "encryption" do
    assert_equal User.encrypt('titok', users(:one).salt), Digest::SHA1.hexdigest("titoka")
  end
end

