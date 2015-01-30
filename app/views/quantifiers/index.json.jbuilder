json.array!(@quantifiers) do |quantifier|
  json.extract! quantifier, :id, :text
  json.url quantifier_url(quantifier, format: :json)
end
