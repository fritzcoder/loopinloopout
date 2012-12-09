require 'test_helper'

class SoundFileBookmarksControllerTest < ActionController::TestCase
  setup do
    @sound_file_bookmark = sound_file_bookmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sound_file_bookmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sound_file_bookmark" do
    assert_difference('SoundFileBookmark.count') do
      post :create, sound_file_bookmark: {  }
    end

    assert_redirected_to sound_file_bookmark_path(assigns(:sound_file_bookmark))
  end

  test "should show sound_file_bookmark" do
    get :show, id: @sound_file_bookmark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sound_file_bookmark
    assert_response :success
  end

  test "should update sound_file_bookmark" do
    put :update, id: @sound_file_bookmark, sound_file_bookmark: {  }
    assert_redirected_to sound_file_bookmark_path(assigns(:sound_file_bookmark))
  end

  test "should destroy sound_file_bookmark" do
    assert_difference('SoundFileBookmark.count', -1) do
      delete :destroy, id: @sound_file_bookmark
    end

    assert_redirected_to sound_file_bookmarks_path
  end
end
