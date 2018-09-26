require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get subscriptions_url, as: :json
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post subscriptions_url, params: { subscription: { billing: @subscription.billing, billing_cycle_anchor: @subscription.billing_cycle_anchor, coupon: @subscription.coupon, customer: @subscription.customer } }, as: :json
    end

    assert_response 201
  end

  test "should show subscription" do
    get subscription_url(@subscription), as: :json
    assert_response :success
  end

  test "should update subscription" do
    patch subscription_url(@subscription), params: { subscription: { billing: @subscription.billing, billing_cycle_anchor: @subscription.billing_cycle_anchor, coupon: @subscription.coupon, customer: @subscription.customer } }, as: :json
    assert_response 200
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete subscription_url(@subscription), as: :json
    end

    assert_response 204
  end
end
