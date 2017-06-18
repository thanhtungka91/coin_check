require 'test_helper'

class CoinChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin_check = coin_checks(:one)
  end

  test "should get index" do
    get coin_checks_url
    assert_response :success
  end

  test "should get new" do
    get new_coin_check_url
    assert_response :success
  end

  test "should create coin_check" do
    assert_difference('CoinCheck.count') do
      post coin_checks_url, params: { coin_check: {  } }
    end

    assert_redirected_to coin_check_url(CoinCheck.last)
  end

  test "should show coin_check" do
    get coin_check_url(@coin_check)
    assert_response :success
  end

  test "should get edit" do
    get edit_coin_check_url(@coin_check)
    assert_response :success
  end

  test "should update coin_check" do
    patch coin_check_url(@coin_check), params: { coin_check: {  } }
    assert_redirected_to coin_check_url(@coin_check)
  end

  test "should destroy coin_check" do
    assert_difference('CoinCheck.count', -1) do
      delete coin_check_url(@coin_check)
    end

    assert_redirected_to coin_checks_url
  end
end
