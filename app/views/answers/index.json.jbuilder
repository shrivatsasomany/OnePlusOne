json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_text
  json.(answer.question)
  json.url answer_url(answer, format: :json)
end