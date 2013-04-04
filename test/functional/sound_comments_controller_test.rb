require 'test_helper'

class SoundCommentsControllerTest < ActionController::TestCase
  setup do
    @sound_comment = sound_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sound_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sound_comment" do
    assert_difference('SoundComment.count') do
      post :create, sound_comment: {  }
    end

    assert_redirected_to sound_comment_path(assigns(:sound_comment))
  end

  test "should show sound_comment" do
    get :show, id: @sound_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sound_comment
    assert_response :success
  end

  test "should update sound_comment" do
    put :update, id: @sound_comment, sound_comment: {  }
    assert_redirected_to sound_comment_path(assigns(:sound_comment))
  end

  test "should destroy sound_comment" do
    assert_difference('SoundComment.count', -1) do
      delete :destroy, id: @sound_comment
    end

    assert_redirected_to sound_comments_path
  end
end
