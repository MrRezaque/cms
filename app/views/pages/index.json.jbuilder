json.array!(@pages) do |page|
  json.extract! page, :id, :meta_keywords, :meta_description, :title, :body, :slug, :template_name, :is_published, :publish_date, :created_by_id, :changed_by_id
  json.url page_url(page, format: :json)
end
