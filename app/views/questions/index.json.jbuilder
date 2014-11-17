json.array!(@questions) do |question|
  json.extract! question, :id, :question_text, :description, :location, :question_type
  json.url question_url(question, format: :json)
end
