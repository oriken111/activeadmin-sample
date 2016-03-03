json.array!(@articles) do |article|
  json.extract! article, :id, :content, :approved
  json.url article_url(article, format: :json)
end
