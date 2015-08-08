class Page < ActiveRecord::Base
  belongs_to :created_by
  belongs_to :changed_by

  belongs_to :parent_page,  class_name: 'Page',
                            foreign_key: 'parent_id'

  has_many :child_pages,    class_name: 'Page',
                            foreign_key: 'parent_id'

  scope :published, ->{ where(approved: true, is_published: true) }
  scope :root_pages, ->{ where(parent_id: 0) }
  scope :uncategorized,   ->{ where(parent_id: nil) }


  # has_many :child_relations,  class_name:   'PageHierarchy',
  #                             foreign_key:  'parent_id'
  # has_many :parent_relations, class_name:   'PageHierarchy',
  #                             foreign_key:  'page_id'

  # scope :root_pages, ->{ joins(:parent_relations).where(page_hierarchies: {parent_id: 0}) }
  # scope :uncategorized, ->{ joins('LEFT JOIN "page_hierarchies"  ON "id" = "page_id" ') }
end
