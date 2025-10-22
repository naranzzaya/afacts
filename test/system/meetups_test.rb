require "application_system_test_case"

class MeetupsTest < ApplicationSystemTestCase
  setup do
    @meetup = meetups(:one)
  end

  test "visiting the index" do
    visit meetups_url
    assert_selector "h1", text: "Meetups"
  end

  test "should create meetup" do
    visit meetups_url
    click_on "New meetup"

    fill_in "Description", with: @meetup.description
    fill_in "Ends at", with: @meetup.ends_at
    fill_in "Starts at", with: @meetup.starts_at
    fill_in "Status", with: @meetup.status
    fill_in "Stream url", with: @meetup.stream_url
    fill_in "Title", with: @meetup.title
    click_on "Create Meetup"

    assert_text "Meetup was successfully created"
    click_on "Back"
  end

  test "should update Meetup" do
    visit meetup_url(@meetup)
    click_on "Edit this meetup", match: :first

    fill_in "Description", with: @meetup.description
    fill_in "Ends at", with: @meetup.ends_at.to_s
    fill_in "Starts at", with: @meetup.starts_at.to_s
    fill_in "Status", with: @meetup.status
    fill_in "Stream url", with: @meetup.stream_url
    fill_in "Title", with: @meetup.title
    click_on "Update Meetup"

    assert_text "Meetup was successfully updated"
    click_on "Back"
  end

  test "should destroy Meetup" do
    visit meetup_url(@meetup)
    click_on "Destroy this meetup", match: :first

    assert_text "Meetup was successfully destroyed"
  end
end
