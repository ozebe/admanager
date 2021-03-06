class Advert < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploaders :images, PhotosUploader
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :images

  scope :titleSearch, -> (title) { where("UPPER (adverts.title) like ?", "%#{title.upcase}%")}

  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end
end
