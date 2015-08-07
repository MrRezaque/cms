class PageHierarchiesController < ApplicationController
  before_action :set_page_hierarchy, only: [:show, :edit, :update, :destroy]

  # GET /page_hierarchies
  # GET /page_hierarchies.json
  def index
    @page_hierarchies = PageHierarchy.all
  end

  # GET /page_hierarchies/1
  # GET /page_hierarchies/1.json
  def show
  end

  # GET /page_hierarchies/new
  def new
    @page_hierarchy = PageHierarchy.new
  end

  # GET /page_hierarchies/1/edit
  def edit
  end

  # POST /page_hierarchies
  # POST /page_hierarchies.json
  def create
    @page_hierarchy = PageHierarchy.new(page_hierarchy_params)

    respond_to do |format|
      if @page_hierarchy.save
        format.html { redirect_to @page_hierarchy, notice: 'Page hierarchy was successfully created.' }
        format.json { render :show, status: :created, location: @page_hierarchy }
      else
        format.html { render :new }
        format.json { render json: @page_hierarchy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_hierarchies/1
  # PATCH/PUT /page_hierarchies/1.json
  def update
    respond_to do |format|
      if @page_hierarchy.update(page_hierarchy_params)
        format.html { redirect_to @page_hierarchy, notice: 'Page hierarchy was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_hierarchy }
      else
        format.html { render :edit }
        format.json { render json: @page_hierarchy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_hierarchies/1
  # DELETE /page_hierarchies/1.json
  def destroy
    @page_hierarchy.destroy
    respond_to do |format|
      format.html { redirect_to page_hierarchies_url, notice: 'Page hierarchy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_hierarchy
      @page_hierarchy = PageHierarchy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_hierarchy_params
      params.require(:page_hierarchy).permit(:page_id, :parent_id)
    end
end
