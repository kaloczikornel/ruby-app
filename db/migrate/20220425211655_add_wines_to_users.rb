class AddWinesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :wines, foreign_key: true
  end
end
