require "test_helper"

class NormalTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normal_tag = normal_tags(:one)
  end

  test "should get index" do
    get normal_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_normal_tag_url
    assert_response :success
  end

  test "should create normal_tag" do
    assert_difference("NormalTag.count") do
      post normal_tags_url, params: { normal_tag: { name: @normal_tag.name } }
    end

    assert_redirected_to normal_tag_url(NormalTag.last)
  end

  test "should show normal_tag" do
    get normal_tag_url(@normal_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_normal_tag_url(@normal_tag)
    assert_response :success
  end

  test "should update normal_tag" do
    patch normal_tag_url(@normal_tag), params: { normal_tag: { name: @normal_tag.name } }
    assert_redirected_to normal_tag_url(@normal_tag)
  end

  test "should destroy normal_tag" do
    assert_difference("NormalTag.count", -1) do
      delete normal_tag_url(@normal_tag)
    end

    assert_redirected_to normal_tags_url
  end
end
