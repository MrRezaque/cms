class RouteController < ApplicationController
  def process(path)
    #render text: params[:path]
    @page = get_page
    page_path = @page.get_url
    unless page_path == params[:path]
      redirect_to "/#{page_path}", status: 301 and return
    end

    render 'pages/default_page'
  end

  private
  def get_page
    page_slug = params[:path].split('/').last
    Page.find_by_slug(page_slug) or page_not_found
  end

end
