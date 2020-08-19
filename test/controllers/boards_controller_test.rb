require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "should get index" do
    get boards_url
    assert_response :success
  end

  test "should get new" do
    get new_board_url
    assert_response :success
  end

  test "should create board" do
    assert_difference('Board.count') do
      post boards_url, params: { board: { abstract: @board.abstract, campus_name_id: @board.campus_name_id, charge: @board.charge, contact: @board.contact, detail: @board.detail, endline: @board.endline, finish_day: @board.finish_day, laboratory: @board.laboratory, number: @board.number, place: @board.place, reward_content: @board.reward_content, reward_id: @board.reward_id, start_day: @board.start_day, title: @board.title } }
    end

    assert_redirected_to board_url(Board.last)
  end

  test "should show board" do
    get board_url(@board)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_url(@board)
    assert_response :success
  end

  test "should update board" do
    patch board_url(@board), params: { board: { abstract: @board.abstract, campus_name_id: @board.campus_name_id, charge: @board.charge, contact: @board.contact, detail: @board.detail, endline: @board.endline, finish_day: @board.finish_day, laboratory: @board.laboratory, number: @board.number, place: @board.place, reward_content: @board.reward_content, reward_id: @board.reward_id, start_day: @board.start_day, title: @board.title } }
    assert_redirected_to board_url(@board)
  end

  test "should destroy board" do
    assert_difference('Board.count', -1) do
      delete board_url(@board)
    end

    assert_redirected_to boards_url
  end
end
