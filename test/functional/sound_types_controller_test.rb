require 'test_helper'

class SoundTypesControllerTest < ActionController::TestCase
  setup do
    @sound_type = sound_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sound_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sound_type" do
    assert_difference('SoundType.count') do
      post :create, sound_type: { name: @sound_type.name }
    end

    assert_redirected_to sound_type_path(assigns(:sound_type))
  end

  test "should show sound_type" do
    get :show, id: @sound_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sound_type
    assert_response :success
  end

  test "should update sound_type" do
    put :update, id: @sound_type, sound_type: { name: @sound_type.name }
    assert_redirected_to sound_type_path(assigns(:sound_type))
  end

  test "should destroy sound_type" do
    assert_difference('SoundType.count', -1) do
      delete :destroy, id: @sound_type
    end

    assert_redirected_to sound_types_path
  end
end
