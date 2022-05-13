class Wine < ApplicationRecord
  belongs_to :user

  def Wine.get_wine_page(page)
    Wine.all.order(created_at: :asc).paginate(page: page, per_page: 2)
  end
end
