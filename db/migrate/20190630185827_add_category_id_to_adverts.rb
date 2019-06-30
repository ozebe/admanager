class AddCategoryIdToAdverts < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :category_id, :integer
    add_index  :adverts, :category_id
  end
end
