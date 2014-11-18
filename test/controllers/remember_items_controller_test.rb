require 'test_helper'

class RememberItemsControllerTest < ActionController::TestCase
  setup do
    @remember_item = remember_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remember_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remember_item" do
    assert_difference('RememberItem.count') do
      post :create, remember_item: { content: @remember_item.content, name: @remember_item.name }
    end

    assert_redirected_to remember_item_path(assigns(:remember_item))
  end

  test "should show remember_item" do
    get :show, id: @remember_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remember_item
    assert_response :success
  end

  test "should update remember_item" do
    patch :update, id: @remember_item, remember_item: { content: @remember_item.content, name: @remember_item.name }
    assert_redirected_to remember_item_path(assigns(:remember_item))
  end

  test "should destroy remember_item" do
    assert_difference('RememberItem.count', -1) do
      delete :destroy, id: @remember_item
    end

    assert_redirected_to remember_items_path
  end
end
