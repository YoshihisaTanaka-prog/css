require "application_system_test_case"

class ValuesTest < ApplicationSystemTestCase
  setup do
    @value = values(:one)
  end

  test "visiting the index" do
    visit values_url
    assert_selector "h1", text: "Values"
  end

  test "should create value" do
    visit values_url
    click_on "New value"

    fill_in "Original tag", with: @value.original_tag_id
    fill_in "Title", with: @value.title_id
    fill_in "Value", with: @value.value
    click_on "Create Value"

    assert_text "Value was successfully created"
    click_on "Back"
  end

  test "should update Value" do
    visit value_url(@value)
    click_on "Edit this value", match: :first

    fill_in "Original tag", with: @value.original_tag_id
    fill_in "Title", with: @value.title_id
    fill_in "Value", with: @value.value
    click_on "Update Value"

    assert_text "Value was successfully updated"
    click_on "Back"
  end

  test "should destroy Value" do
    visit value_url(@value)
    click_on "Destroy this value", match: :first

    assert_text "Value was successfully destroyed"
  end
end
