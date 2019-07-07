class AddViewsToAdvert < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :views, :integer
  end
end
