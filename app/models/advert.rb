class Advert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploaders :images, PhotosUploader
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :images
end
