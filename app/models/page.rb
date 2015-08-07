class Page < ActiveRecord::Base
  belongs_to :created_by
  belongs_to :changed_by

  has_many :child_relations,  class_name:   'PageHierarchy',
                              foreign_key:  'parent_id'
  has_many :parent_relations, class_name:   'PageHierarchy',
                              foreign_key:  'page_id'

  scope :published, ->{ where(approved: true, is_published: true) }
  # scope :root_categories, ->{ joins(:parent_relations).where('parent_id = 0') }
  scope :root_categories, ->{ joins(:parent_relations).where(page_hierarchies: {parent_id: 0}) }
  scope :uncategorized, ->{ joins('LEFT JOIN "page_hierarchies"  ON "id" = "page_id" ') }
end
