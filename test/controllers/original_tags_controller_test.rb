require "test_helper"

class OriginalTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @original_tag = original_tags(:one)
  end

  test "should get index" do
    get original_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_original_tag_url
    assert_response :success
  end

  test "should create original_tag" do
    assert_difference("OriginalTag.count") do
      post original_tags_url, params: { original_tag: { name: @original_tag.name, parent_id: @original_tag.parent_id, product_id: @original_tag.product_id } }
    end

    assert_redirected_to original_tag_url(OriginalTag.last)
  end

  test "should show original_tag" do
    get original_tag_url(@original_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_original_tag_url(@original_tag)
    assert_response :success
  end

  test "should update original_tag" do
    patch original_tag_url(@original_tag), params: { original_tag: { name: @original_tag.name, parent_id: @original_tag.parent_id, product_id: @original_tag.product_id } }
    assert_redirected_to original_tag_url(@original_tag)
  end

  test "should destroy original_tag" do
    assert_difference("OriginalTag.count", -1) do
      delete original_tag_url(@original_tag)
    end

    assert_redirected_to original_tags_url
  end
end
