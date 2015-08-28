module PagesHelper
  def root_categories_select_list(current_page_id = -1)
    list = Page.published.root_pages
               .select{   |category| category.id != current_page_id }
               .collect{  |category| [category.title, category.id]  }
    list << ['Страница первого уровня', 0]
  end

  def page_status(page = @page)
    if page.approved
      "Утверждена"
    elsif page.to_be_moderated
      "Ожидает модерации"
    else
      "В черновиках"
    end
  end

  def moderate_button_content(page = @page)
    unless page.approved
      if page.to_be_moderated
        text = "Отменить модерацию"
      else
        text = "Отправить на модерацию"
      end
    end
  end

  def show_moderate_button?(page = @page)
    !page.approved
  end
end
