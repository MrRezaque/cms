module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def meta_keywords(meta_keywords)
    content_for(:meta_keywords) {meta_keywords}
  end
  def meta_description(meta_desc)
    content_for(:meta_desc) {meta_desc}
  end
end
