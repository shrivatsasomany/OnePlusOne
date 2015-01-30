json.extract! @answer, :id, :created_at, :updated_at
json.quantifier @answer.quantifier
json.image(@answer.answer_image.url)
