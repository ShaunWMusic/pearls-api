require 'test_helper'

class NewAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_account = new_accounts(:one)
  end

  test "should get index" do
    get new_accounts_url, as: :json
    assert_response :success
  end

  test "should create new_account" do
    assert_difference('NewAccount.count') do
      post new_accounts_url, params: { new_account: { email: @new_account.email, password_digest: @new_account.password_digest, token: @new_account.token } }, as: :json
    end

    assert_response 201
  end

  test "should show new_account" do
    get new_account_url(@new_account), as: :json
    assert_response :success
  end

  test "should update new_account" do
    patch new_account_url(@new_account), params: { new_account: { email: @new_account.email, password_digest: @new_account.password_digest, token: @new_account.token } }, as: :json
    assert_response 200
  end

  test "should destroy new_account" do
    assert_difference('NewAccount.count', -1) do
      delete new_account_url(@new_account), as: :json
    end

    assert_response 204
  end
end
