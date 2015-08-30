class PagesController < AdminPanelController
  before_action :set_page, only: [:approve_page, :show, :edit, :update, :destroy]
  #layout :application, only: :preview


  def my_articles
    @pages = current_user.pages

  end

  def preview
    #raise params.inspect
    @page = Page.find(params[:id])
    render 'default_page', layout: 'application'
  end

  def toggle_to_be_moderated
    @page = Page.find(params[:page][:id])
    @page.to_be_moderated = !@page.to_be_moderated
    @page.save!
    redirect_to pages_my_articles_path
  end

  # def toggle_page_published
  #   @page = Page.find(params[:page][:id])
  #   authorize! :update, @page
  #   if @page.is_published
  #     @page.is_published = false
  #   else
  #     @page.is_published = true
  #   end
  #   @page.save
  #   redirect_to request.referer
  # end

  def approve_page
    # @page = Page.find(params[:id])
    authorize! :approve, @page
    authorize! :update,  @page
    #raise page_params.inspect
    @page.assign_attributes(page_params)
    @page.approved = true
    @page.approved_by_id = current_user.id
    @page.save!(page_params)
    #raise @page.attributes.inspect
    @page.creator.remove_role :owner, @page
    redirect_to request.referer
  end

  # GET /pages
  # GET /pages.json
  def index
    @root_pages = Page.root_pages
    @uncategorized_pages = Page.uncategorized
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end


  # GET /pages/new
  def new
    self.create
  end

  # GET /pages/1/edit
  def edit
    @current_user = nil
    @current_ability = nil
    authorize! :update, @page
  end

  # POST /pages
  # POST /pages.json
  def create
    authorize! :create, Page
    @page = Page.new
    @page.created_by_id = current_user.id

    # # temporary hardcoded, check role later
    # @page.approved = true

    respond_to do |format|
      if @page.save(validate: false)
        set_owner
        format.html { redirect_to edit_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :index }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    authorize! :update, @page
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    authorize! :destroy, @page
    @page.destroy
    respond_to do |format|
      format.html { redirect_to  request.referer || pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
      authorize! :read, @page
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      field_list = [:id, :meta_keywords, :meta_description, :title, :body, :slug, :parent_id, :page_icon, :template_name,
                    :is_published, :approved, :publish_date, :created_by_id, :changed_by_id, :to_be_moderated]
      if can? :approve, @page
          field_list << :approved
      end
      params.require(:page).permit(field_list)
    end

    def set_owner
      current_user.add_role :owner, @page
    end
end
