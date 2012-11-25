require 'test_helper'

class LusersControllerTest < ActionController::TestCase
  setup do
    @luser = lusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create luser" do
    assert_difference('Luser.count') do
      post :create, luser: { name: @luser.name }
    end

    assert_redirected_to luser_path(assigns(:luser))
  end

  test "should show luser" do
    get :show, id: @luser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @luser
    assert_response :success
  end

  test "should update luser" do
    put :update, id: @luser, luser: { name: @luser.name }
    assert_redirected_to luser_path(assigns(:luser))
  end

  test "should destroy luser" do
    assert_difference('Luser.count', -1) do
      delete :destroy, id: @luser
    end

    assert_redirected_to lusers_path
  end
end
