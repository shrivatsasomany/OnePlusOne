json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_text
  json.question answer.question
  json.quantifier answer.quantifier
  json.image(answer.answer_image.url)
  json.url answer_url(answer, format: :json)
end