require 'test_helper'

class SoundBanksControllerTest < ActionController::TestCase
  setup do
    @sound_bank = sound_banks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sound_banks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sound_bank" do
    assert_difference('SoundBank.count') do
      post :create, sound_bank: { access: @sound_bank.access, collaboration: @sound_bank.collaboration, description: @sound_bank.description, name: @sound_bank.name, type: @sound_bank.type }
    end

    assert_redirected_to sound_bank_path(assigns(:sound_bank))
  end

  test "should show sound_bank" do
    get :show, id: @sound_bank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sound_bank
    assert_response :success
  end

  test "should update sound_bank" do
    put :update, id: @sound_bank, sound_bank: { access: @sound_bank.access, collaboration: @sound_bank.collaboration, description: @sound_bank.description, name: @sound_bank.name, type: @sound_bank.type }
    assert_redirected_to sound_bank_path(assigns(:sound_bank))
  end

  test "should destroy sound_bank" do
    assert_difference('SoundBank.count', -1) do
      delete :destroy, id: @sound_bank
    end

    assert_redirected_to sound_banks_path
  end
end
