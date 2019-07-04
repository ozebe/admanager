class AddImagesToAdvert < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts, :images, :string, array: true, default: [] # add images column as array
  end
end
