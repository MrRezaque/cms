class PageHierarchy < ActiveRecord::Base
  belongs_to :child_page, class_name: 'Page',
             foreign_key:  'page_id'
  belongs_to :parent_page, class_name: 'Page',
             foreign_key:  'parent_id'
end
