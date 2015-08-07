require 'test_helper'

class PageHierarchiesControllerTest < ActionController::TestCase
  setup do
    @page_hierarchy = page_hierarchies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_hierarchies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_hierarchy" do
    assert_difference('PageHierarchy.count') do
      post :create, page_hierarchy: { page_id: @page_hierarchy.page_id, parent_id: @page_hierarchy.parent_id }
    end

    assert_redirected_to page_hierarchy_path(assigns(:page_hierarchy))
  end

  test "should show page_hierarchy" do
    get :show, id: @page_hierarchy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_hierarchy
    assert_response :success
  end

  test "should update page_hierarchy" do
    patch :update, id: @page_hierarchy, page_hierarchy: { page_id: @page_hierarchy.page_id, parent_id: @page_hierarchy.parent_id }
    assert_redirected_to page_hierarchy_path(assigns(:page_hierarchy))
  end

  test "should destroy page_hierarchy" do
    assert_difference('PageHierarchy.count', -1) do
      delete :destroy, id: @page_hierarchy
    end

    assert_redirected_to page_hierarchies_path
  end
end
