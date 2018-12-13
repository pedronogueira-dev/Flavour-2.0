require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  test "should get upcoming_meals" do
    get meals_upcoming_meals_url
    assert_response :success
  end

  test "should get past_meals" do
    get meals_past_meals_url
    assert_response :success
  end

  test "should get show" do
    get meals_show_url
    assert_response :success
  end

end
