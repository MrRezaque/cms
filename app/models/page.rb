class Page < ActiveRecord::Base
  belongs_to :creator,foreign_key: :created_by_id, class_name: User
  #belongs_to :changed_by

  belongs_to :parent_page,  class_name: 'Page',
                            foreign_key: 'parent_id'

  has_many :child_pages,    class_name: 'Page',
                            foreign_key: 'parent_id'

  scope :published, ->{ where(approved: true, is_published: true) }
  scope :root_pages, ->{ where(parent_id: 0) }
  scope :uncategorized,   ->{ where(parent_id: nil) }
  scope :waiting_for_approve, ->{ where(to_be_moderated: true, approved: false) }

  mount_uploader :page_icon, PageIconUploader
  resourcify


  def get_url
    build_path(self)
  end

  protected
  def build_path(page)
    if page.parent_page.nil?
      page.slug
    else
      "#{build_path(page.parent_page)}/#{page.slug}"
    end
  end

  # has_many :child_relations,  class_name:   'PageHierarchy',
  #                             foreign_key:  'parent_id'
  # has_many :parent_relations, class_name:   'PageHierarchy',
  #                             foreign_key:  'page_id'

  # scope :root_pages, ->{ joins(:parent_relations).where(page_hierarchies: {parent_id: 0}) }
  # scope :uncategorized, ->{ joins('LEFT JOIN "page_hierarchies"  ON "id" = "page_id" ') }
end
