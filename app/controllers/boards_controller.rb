class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :valid_user!, only: [:edit, :update, :destroy]
  before_action :twitter_client, only: [:create]

  # GET /boards
  # GET /boards.json
  def index
    @pagy, @boards = pagy(Board.all.order(id: :DESC))
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

    if @board.save
      @client.update("#{@board.title} #{board_url(@board.id)}\r")
      redirect_to @board, notice: '募集要項を作成しました'
    else
      render :new
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
      if @board.update(board_params)
        redirect_to @board, notice: '募集要項を更新しました'
      else
        render :edit
      end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
      redirect_to boards_url, notice: '募集要項を削除しました'
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

    def twitter_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.credentials.twitter[:api_key]
        config.consumer_secret     = Rails.application.credentials.twitter[:api_secret_key]
        config.access_token        = Rails.application.credentials.twitter[:access_token]
        config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
      end
    end
  end
