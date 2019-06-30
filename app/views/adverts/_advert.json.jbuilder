json.extract! advert, :id, :title, :description, :price, :created_at, :updated_at
json.url advert_url(advert, format: :json)
