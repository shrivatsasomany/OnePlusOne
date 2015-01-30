require 'test_helper'

class QuantifiersControllerTest < ActionController::TestCase
  setup do
    @quantifier = quantifiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quantifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quantifier" do
    assert_difference('Quantifier.count') do
      post :create, quantifier: { text: @quantifier.text }
    end

    assert_redirected_to quantifier_path(assigns(:quantifier))
  end

  test "should show quantifier" do
    get :show, id: @quantifier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quantifier
    assert_response :success
  end

  test "should update quantifier" do
    patch :update, id: @quantifier, quantifier: { text: @quantifier.text }
    assert_redirected_to quantifier_path(assigns(:quantifier))
  end

  test "should destroy quantifier" do
    assert_difference('Quantifier.count', -1) do
      delete :destroy, id: @quantifier
    end

    assert_redirected_to quantifiers_path
  end
end
