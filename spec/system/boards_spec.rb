require 'rails_helper'

describe '掲示板管理機能', type: :system do
  faculty_a = Faculty.first
  campus_name_a = CampusName.first
  reward_a = Reward.first
  let(:user_a) { create(:user, faculty: faculty_a) }
  let(:user_b) { create(:user, faculty: faculty_a) }

  shared_context 'ユーザーAとしてログイン' do
    before do
      user_a.skip_confirmation!
      user_a.save!
      visit new_user_session_path
      fill_in 'Eメール', with: user_a.email
      fill_in 'パスワード', with: user_a.password
      click_button 'ログイン'
    end
  end

  describe '一覧表示機能' do
    let!(:board) { create(:board, user: creator_user, campus_name: campus_name_a, reward: reward_a) }
    context 'ユーザーAとしてログインしている時' do
      include_context 'ユーザーAとしてログイン'

      # # 募集要項表示の確認
      # shared_example '' do
      #   it { is_expected.to eq '' }
      # end

      context '募集要項の作成者がAの時' do
        let(:creator_user) { user_a }
        it 'ユーザーAが作成した募集要項に編集ボタンされ、募集要項一覧が表示される' do
          visit boards_path
          expect(page).to have_content '実験の募集'
          expect(page).to have_content '編集'
        end
      end
      context '募集要項の作成者がBの時' do
        let(:creator_user) { user_b }
        it 'ユーザーBが作成した募集要項に編集ボタンには表示されないず、募集要項一覧が表示される' do
          visit boards_path
          expect(page).to have_content '実験の募集'
          expect(page).to have_no_content '編集'
        end
      end
    end
    context "ログインしていない時" do
      let(:creator_user) { user_a }
      it '編集ボタンには表示されないず、一覧が表示される' do
        visit boards_path
        expect(page).to have_content '実験の募集'
        expect(page).to have_no_content '編集'
      end
    end
  end
  describe '詳細表示機能' do
    let!(:board) { create(:board, user: user_a, campus_name: campus_name_a, reward: reward_a) } 

    context "ログインしている時" do
      include_context 'ユーザーAとしてログイン'
      
      it '編集ボタンと募集要項の詳細が表示される' do
        visit board_path(board.id)
        expect(page).to have_content '実験の募集'
        expect(page).to have_content '編集'
      end
    end

    context "ログインしていない時" do
      it '募集要項の詳細が表示される' do
        visit board_path(board.id)
        expect(page).to have_content '実験の募集'
        expect(page).to have_no_content '編集'
      end
    end
  end
  describe '作成機能' do
    context 'ユーザーがログインしている時' do
      include_context 'ユーザーAとしてログイン'
      
      before do
        visit new_board_path
        fill_in 'タイトル', with: '地獄の実験'
        fill_in '概要', with: 'VO2max65%の運動強度での60分間の自転車運動'
        select '草津', from: '実施キャンパス'
        fill_in '研究室名', with: 'ブラック研究室'
        select '2021', from: 'board_start_day_1i'
        select '1', from: 'board_start_day_2i'
        select '1', from: 'board_start_day_3i'
        select '2021', from: 'board_finish_day_1i'
        select '1', from: 'board_finish_day_2i'
        select '10', from: 'board_finish_day_3i'
        fill_in '実施場所', with: 'インテグレーションコア３階'
        select '謝金あり', from: '謝礼の有無'
        fill_in '報酬内容', with: '20000円'
        fill_in '募集人数', with: 15
        fill_in '責任者', with: '八木雅斗'
        fill_in '連絡先(LINEのIDやメールアドレスなど)', with: '0909548****'
      end

      it '掲示板(画像なし)が作成できる' do
        find('#trix-editor').set('あとで書く')
        click_button '被験者を募集する'
        expect(current_path).to eq board_path
        expect(page).to have_content '地獄の実験'
      end

      it '掲示板(画像あり)が作成できる' do ##### ログインできてない
        attach_file_to_trix_editor('/workspace/spec/files/image.png')
        click_button '被験者を募集する'
        expect(current_path).to eq board_path # 現在のページが特定のパスであることを検証する
        expect(page).to have_content '地獄の実験'
        expect(page).to have_selector("img")
      end
    end

    context 'ユーザーがログインしていない時' do
      it '作成画面に遷移できない' do ######### ログインできてない
        visit new_board_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end

  describe '編集機能' do
    # context "ログインしている時" do
    #   let(:login_user) { user_a }
    #   it '掲示板(画像あり)が編集できる' do
    #     expect(page).to have_content 
    #   end
    # end

    # context "ログインしていない時" do
    #   it '編集画面に遷移できない' do
    #     expect(page).to have_content '作成ユーザーでないと編集できません'
    #   end
    # end

    # context "作成したユーザーでない時" do
      
    # end
  end
end
