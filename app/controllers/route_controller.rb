class RouteController < ApplicationController
  def process(path)
    #render text: params[:path]
    page = get_page
    page_path = build_path(page)
    unless page_path == params[:path]
      redirect_to "/#{page_path}", status: 301
    end

    render 'pages/default_page'
  end

  private
  def get_page
    page_slug = params[:path].split('/').last
    Page.find_by_slug(page_slug) or page_not_found
  end
  def build_path(page)
    if page.parent_page.nil?
      page.slug
    else
      "#{build_path(page.parent_page)}/#{page.slug}"
    end
  end
end
