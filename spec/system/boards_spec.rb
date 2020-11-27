require 'rails_helper'

describe '掲示板管理機能', type: :system do
  describe '一覧表示機能' do
    faculty_a = Faculty.first
    faculty_b = Faculty.last
    let(:user_a){ FactoryBot.create(:user, name: 'ユーザーA', email: 'a@ed.ritsumei.ac.jp', password: 'password', faculty: faculty_a ) }

    before do
      # # 学部名を作成しておく
      # faculty_a = FactoryBot.create(:faculty)
      # # キャンパス一覧のデータを作成する
      # campus_name_a = FactoryBot.create(:campus_name)
      # # 報酬種類一覧のデータを作成する
      # reward_a = FactoryBot.create(:reward)
      # 作成者がユーザーAであるタスクを作成しておく
      FactoryBot.create(:board, title: 'Aの実験の募集', abstract: '要約A', detail: '詳細A', campus_name_id: 2, laboratory: 'A研究室', start_day: "2020-08-23", finish_day: "2020-08-28", place: 'A棟3階', reward_id: 2, reward_content: '1000円', number: 15, charge: 'Aoki', contact: 'a@ed.ritsumei.ac.jp', endline: "2020-08-28", user: user_a)
      # FactoryBot.create(:faculty, name: '理工学部')
      # 本人確認の認証を済ませておく
      user_a.confirm
      # ユーザーAでログインする
      visit new_user_session_path
      # メールアドレスを入力
      fill_in 'Eメール', with: 'login_user.email'
      fill_in 'パスワード', with: 'login_user.password'
      click_on "ログイン"
    end

    context 'ユーザーがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成したタスクが表示される' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        # ログイン画面にアクセス
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ログインできない' do
        expect(page).to have_no_content 'ログインしました。'
      end
    end
  end
end
