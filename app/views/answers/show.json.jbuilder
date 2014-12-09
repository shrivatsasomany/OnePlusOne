json.extract! @answer, :id, :created_at, :updated_at
json.(@answer.quantifier, :text)

