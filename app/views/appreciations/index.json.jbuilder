json.array!(@appreciations) do |appreciation|
  json.extract! appreciation, :id, :content, :remark, :category_id
  json.url appreciation_url(appreciation, format: :json)
end
