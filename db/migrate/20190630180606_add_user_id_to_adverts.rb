class AddUserIdToAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :user_id, :integer
    add_index  :adverts, :user_id
  end
end
