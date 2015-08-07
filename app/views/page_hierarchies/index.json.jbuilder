json.array!(@page_hierarchies) do |page_hierarchy|
  json.extract! page_hierarchy, :id, :page_id, :parent_id
  json.url page_hierarchy_url(page_hierarchy, format: :json)
end
