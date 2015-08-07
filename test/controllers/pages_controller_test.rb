require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { body: @page.body, changed_by_id: @page.changed_by_id, created_by_id: @page.created_by_id, is_published: @page.is_published, meta_description: @page.meta_description, meta_keywords: @page.meta_keywords, publish_date: @page.publish_date, slug: @page.slug, template_name: @page.template_name, title: @page.title }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    patch :update, id: @page, page: { body: @page.body, changed_by_id: @page.changed_by_id, created_by_id: @page.created_by_id, is_published: @page.is_published, meta_description: @page.meta_description, meta_keywords: @page.meta_keywords, publish_date: @page.publish_date, slug: @page.slug, template_name: @page.template_name, title: @page.title }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to pages_path
  end
end
