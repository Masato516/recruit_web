require "application_system_test_case"

class BoardsTest < ApplicationSystemTestCase
  setup do
    @board = boards(:one)
  end

  test "visiting the index" do
    visit boards_url
    assert_selector "h1", text: "Boards"
  end

  test "creating a Board" do
    visit boards_url
    click_on "New Board"

    fill_in "Abstract", with: @board.abstract
    fill_in "Campus name", with: @board.campus_name_id
    fill_in "Charge", with: @board.charge
    fill_in "Contact", with: @board.contact
    fill_in "Detail", with: @board.detail
    fill_in "Endline", with: @board.endline
    fill_in "Finish day", with: @board.finish_day
    fill_in "Laboratory", with: @board.laboratory
    fill_in "Number", with: @board.number
    fill_in "Place", with: @board.place
    fill_in "Reward content", with: @board.reward_content
    fill_in "Reward", with: @board.reward_id
    fill_in "Start day", with: @board.start_day
    fill_in "Title", with: @board.title
    click_on "Create Board"

    assert_text "Board was successfully created"
    click_on "Back"
  end

  test "updating a Board" do
    visit boards_url
    click_on "Edit", match: :first

    fill_in "Abstract", with: @board.abstract
    fill_in "Campus name", with: @board.campus_name_id
    fill_in "Charge", with: @board.charge
    fill_in "Contact", with: @board.contact
    fill_in "Detail", with: @board.detail
    fill_in "Endline", with: @board.endline
    fill_in "Finish day", with: @board.finish_day
    fill_in "Laboratory", with: @board.laboratory
    fill_in "Number", with: @board.number
    fill_in "Place", with: @board.place
    fill_in "Reward content", with: @board.reward_content
    fill_in "Reward", with: @board.reward_id
    fill_in "Start day", with: @board.start_day
    fill_in "Title", with: @board.title
    click_on "Update Board"

    assert_text "Board was successfully updated"
    click_on "Back"
  end

  test "destroying a Board" do
    visit boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board was successfully destroyed"
  end
end
