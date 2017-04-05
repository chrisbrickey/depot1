require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
      # post line_items_url, params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } } REPLACED THIS LINE WITH ABOVE LINE WHEN ADDED CART BUTTON AND CART PAGE
    end

    follow_redirect!
    assert_select 'h2', "Your Cart"
    assert_select 'td', "Programming Ruby 1.9"
    # assert_redirected_to line_item_url(LineItem.last) REPLACED THIS LINE WITH THE THREE LINES DIRECTLY ABOVE IT WHEN ADDED CART BUTTON AND CART PAGE
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item),
      params: { line_item: { product_id: @line_item.product_id } } #removed term with cart_id in it
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end