class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :valid_authenticate_user!, only: [:edit, :update, :destroy]
  before_action :twitter_client, only: [:create, :update]

  # GET /boards
  def index
    @pagy, @boards = pagy(Board.all.order(updated_at: :DESC).preload(:user))
  end

  # GET /boards/1
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
  def create
    @board = Board.new(board_params)
    # ツイートの有無を取得
    required_tweet = params[:board][:required_tweet]

    # TODO: メソッド化 or ヘルパー化する
    if @board.save
      if required_tweet
        # boardを作成し,idが付与されてからURLを作成する必要あり
        tweet_content = "#{@board.title} #{board_url(@board.id)} "
        # ツイート内容の作成
        tweet_content += "#謝礼あり" if @board.reward_present?
        # ツイートする必要があれば、ツイートする
        @client.update(tweet_content)
      end
      redirect_to @board, notice: '募集要項を作成しました'
    else
      render :new
    end
  end

  # PATCH/PUT /boards/1
  def update
    # ツイートの有無を取得
    required_tweet = params[:board][:required_tweet]

    if @board.update(board_params)
      if required_tweet
        # boardを作成し,idが付与されてからURLを作成する必要あり
        tweet_content = "#{@board.title} #{board_url(@board.id)} "
        # ツイート内容の作成
        tweet_content += "#謝礼あり" if @board.reward_present?
        # ツイートする必要があれば、ツイートする
        @client.update(tweet_content)
      end
      redirect_to @board, notice: '募集要項を更新しました'
    else
      render :edit
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
    redirect_to boards_path, notice: '募集要項を削除しました'
  end

  private

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:title, 
                                    :abstract, 
                                    :detail, 
                                    :campus_name_id, 
                                    :laboratory, 
                                    :start_day, 
                                    :finish_day, 
                                    :place, 
                                    :reward_present, 
                                    :reward_content, 
                                    :required_number,
                                    :contact_detail,
                                    :public_end_date)
                                    .merge(user_id: current_user.id)
    end

    def valid_authenticate_user!
      # TODO: redirect_back をなぜ利用したか、どのように動くか確認！
      board = Board.find(params[:id])

      # ユーザーが削除されているとboardのuser_idがnilになる可能性があるため、ぼっち演算子を利用
      unless current_user.id == board&.user_id 
        flash[:danger] = '作成ユーザーでないと編集できません'
        redirect_back fallback_location: board_path(board)
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
