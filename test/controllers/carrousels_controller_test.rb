require 'test_helper'

class CarrouselsControllerTest < ActionController::TestCase
  setup do
    @carrousel = carrousels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carrousels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carrousel" do
    assert_difference('Carrousel.count') do
      post :create, carrousel: {  }
    end

    assert_redirected_to carrousel_path(assigns(:carrousel))
  end

  test "should show carrousel" do
    get :show, id: @carrousel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carrousel
    assert_response :success
  end

  test "should update carrousel" do
    patch :update, id: @carrousel, carrousel: {  }
    assert_redirected_to carrousel_path(assigns(:carrousel))
  end

  test "should destroy carrousel" do
    assert_difference('Carrousel.count', -1) do
      delete :destroy, id: @carrousel
    end

    assert_redirected_to carrousels_path
  end
end
