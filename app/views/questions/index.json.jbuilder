json.array!(@questions) do |question|
  json.extract! question, :id, :question_text, :description, :location, :question_type, :is_quantifier
  json.url question_url(question, format: :json)
end
