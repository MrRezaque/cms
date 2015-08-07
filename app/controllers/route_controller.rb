class RouteController < ApplicationController
  def process(path)
    look_up(path)
  end

  private
  def look_up(path)
    page_slug = path.split('/').last
    page = Page.find_by_slug(page_slug) or page_not_found
    render 'page'
  end
end
