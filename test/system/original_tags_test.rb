require "application_system_test_case"

class OriginalTagsTest < ApplicationSystemTestCase
  setup do
    @original_tag = original_tags(:one)
  end

  test "visiting the index" do
    visit original_tags_url
    assert_selector "h1", text: "Original tags"
  end

  test "should create original tag" do
    visit original_tags_url
    click_on "New original tag"

    fill_in "Name", with: @original_tag.name
    fill_in "Parent", with: @original_tag.parent_id
    fill_in "Product", with: @original_tag.product_id
    click_on "Create Original tag"

    assert_text "Original tag was successfully created"
    click_on "Back"
  end

  test "should update Original tag" do
    visit original_tag_url(@original_tag)
    click_on "Edit this original tag", match: :first

    fill_in "Name", with: @original_tag.name
    fill_in "Parent", with: @original_tag.parent_id
    fill_in "Product", with: @original_tag.product_id
    click_on "Update Original tag"

    assert_text "Original tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Original tag" do
    visit original_tag_url(@original_tag)
    click_on "Destroy this original tag", match: :first

    assert_text "Original tag was successfully destroyed"
  end
end
