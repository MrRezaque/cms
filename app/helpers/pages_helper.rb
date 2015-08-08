module PagesHelper
  def root_categories_select_list
    list = Page.root_pages.collect{ |category| [category.title, category.id] }
    list << ['Страница первого уровня', 0]
  end
end
