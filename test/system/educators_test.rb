require "application_system_test_case"

class EducatorsTest < ApplicationSystemTestCase
  setup do
    @educator = educators(:one)
  end

  test "visiting the index" do
    visit educators_url
    assert_selector "h1", text: "Educators"
  end

  test "creating a Educator" do
    visit educators_url
    click_on "New Educator"

    fill_in "Account", with: @educator.account_id
    fill_in "Class", with: @educator.class
    fill_in "First name", with: @educator.first_name
    fill_in "Last name", with: @educator.last_name
    fill_in "Photo", with: @educator.photo
    fill_in "User", with: @educator.user_id
    click_on "Create Educator"

    assert_text "Educator was successfully created"
    click_on "Back"
  end

  test "updating a Educator" do
    visit educators_url
    click_on "Edit", match: :first

    fill_in "Account", with: @educator.account_id
    fill_in "Class", with: @educator.class
    fill_in "First name", with: @educator.first_name
    fill_in "Last name", with: @educator.last_name
    fill_in "Photo", with: @educator.photo
    fill_in "User", with: @educator.user_id
    click_on "Update Educator"

    assert_text "Educator was successfully updated"
    click_on "Back"
  end

  test "destroying a Educator" do
    visit educators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Educator was successfully destroyed"
  end
end
