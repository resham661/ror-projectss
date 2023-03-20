require "application_system_test_case"

class PoniesTest < ApplicationSystemTestCase
  setup do
    @pony = ponies(:one)
  end

  test "visiting the index" do
    visit ponies_url
    assert_selector "h1", text: "Ponies"
  end

  test "should create pony" do
    visit ponies_url
    click_on "New pony"

    fill_in "Name", with: @pony.name
    fill_in "Profesion", with: @pony.profesion
    click_on "Create Pony"

    assert_text "Pony was successfully created"
    click_on "Back"
  end

  test "should update Pony" do
    visit pony_url(@pony)
    click_on "Edit this pony", match: :first

    fill_in "Name", with: @pony.name
    fill_in "Profesion", with: @pony.profesion
    click_on "Update Pony"

    assert_text "Pony was successfully updated"
    click_on "Back"
  end

  test "should destroy Pony" do
    visit pony_url(@pony)
    click_on "Destroy this pony", match: :first

    assert_text "Pony was successfully destroyed"
  end
end
