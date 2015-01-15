require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { accepted_at: @order.accepted_at, content: @order.content, delivery_fee: @order.delivery_fee, finished_at: @order.finished_at, items_fee: @order.items_fee, order_fee: @order.order_fee, reject_reason: @order.reject_reason, status: @order.status, store_id: @order.store_id, store_name: @order.store_name, tip: @order.tip, user_id: @order.user_id }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { accepted_at: @order.accepted_at, content: @order.content, delivery_fee: @order.delivery_fee, finished_at: @order.finished_at, items_fee: @order.items_fee, order_fee: @order.order_fee, reject_reason: @order.reject_reason, status: @order.status, store_id: @order.store_id, store_name: @order.store_name, tip: @order.tip, user_id: @order.user_id }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
