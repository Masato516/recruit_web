class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :valid_user!, only: [:edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @pagy, @boards = pagy(Board.all)
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: '募集要項を作成しました' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: '募集要項を更新しました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: '募集要項を削除しました' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:title, :abstract, :detail, :campus_name_id, :laboratory, :start_day, :finish_day, :place, :reward_id, :reward_content, :number, :charge, :contact, :endline).merge(user_id: current_user.id)
    end

    def valid_user!
      board = Board.find(params[:id])
      unless current_user.id == board.user_id 
        flash[:danger] = '作成ユーザーでないと編集できません'
        redirect_back(fallback_location: board_path(board))
      end
    end
  end
