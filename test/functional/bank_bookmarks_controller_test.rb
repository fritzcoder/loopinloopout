require 'test_helper'

class BankBookmarksControllerTest < ActionController::TestCase
  setup do
    @bank_bookmark = bank_bookmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_bookmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_bookmark" do
    assert_difference('BankBookmark.count') do
      post :create, bank_bookmark: {  }
    end

    assert_redirected_to bank_bookmark_path(assigns(:bank_bookmark))
  end

  test "should show bank_bookmark" do
    get :show, id: @bank_bookmark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank_bookmark
    assert_response :success
  end

  test "should update bank_bookmark" do
    put :update, id: @bank_bookmark, bank_bookmark: {  }
    assert_redirected_to bank_bookmark_path(assigns(:bank_bookmark))
  end

  test "should destroy bank_bookmark" do
    assert_difference('BankBookmark.count', -1) do
      delete :destroy, id: @bank_bookmark
    end

    assert_redirected_to bank_bookmarks_path
  end
end
