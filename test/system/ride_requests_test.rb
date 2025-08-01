require "application_system_test_case"

class RideRequestsTest < ApplicationSystemTestCase
  setup do
    @ride_request = ride_requests(:one)
  end

  test "visiting the index" do
    visit ride_requests_url
    assert_selector "h1", text: "Ride requests"
  end

  test "should create ride request" do
    visit ride_requests_url
    click_on "New ride request"

    fill_in "Email", with: @ride_request.email
    fill_in "Location", with: @ride_request.location
    fill_in "Name", with: @ride_request.name
    fill_in "Notes", with: @ride_request.notes
    fill_in "Pickup time", with: @ride_request.pickup_time
    click_on "Create Ride request"

    assert_text "Ride request was successfully created"
    click_on "Back"
  end

  test "should update Ride request" do
    visit ride_request_url(@ride_request)
    click_on "Edit this ride request", match: :first

    fill_in "Email", with: @ride_request.email
    fill_in "Location", with: @ride_request.location
    fill_in "Name", with: @ride_request.name
    fill_in "Notes", with: @ride_request.notes
    fill_in "Pickup time", with: @ride_request.pickup_time.to_s
    click_on "Update Ride request"

    assert_text "Ride request was successfully updated"
    click_on "Back"
  end

  test "should destroy Ride request" do
    visit ride_request_url(@ride_request)
    click_on "Destroy this ride request", match: :first

    assert_text "Ride request was successfully destroyed"
  end
end
