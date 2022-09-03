require "application_system_test_case"

class NormalTagsTest < ApplicationSystemTestCase
  setup do
    @normal_tag = normal_tags(:one)
  end

  test "visiting the index" do
    visit normal_tags_url
    assert_selector "h1", text: "Normal tags"
  end

  test "should create normal tag" do
    visit normal_tags_url
    click_on "New normal tag"

    fill_in "Name", with: @normal_tag.name
    click_on "Create Normal tag"

    assert_text "Normal tag was successfully created"
    click_on "Back"
  end

  test "should update Normal tag" do
    visit normal_tag_url(@normal_tag)
    click_on "Edit this normal tag", match: :first

    fill_in "Name", with: @normal_tag.name
    click_on "Update Normal tag"

    assert_text "Normal tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Normal tag" do
    visit normal_tag_url(@normal_tag)
    click_on "Destroy this normal tag", match: :first

    assert_text "Normal tag was successfully destroyed"
  end
end
