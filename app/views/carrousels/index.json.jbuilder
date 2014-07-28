json.array!(@carrousels) do |carrousel|
  json.extract! carrousel, :id
  json.url carrousel_url(carrousel, format: :json)
end
