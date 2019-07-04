class Advert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploaders :images, PhotosUploader
end
