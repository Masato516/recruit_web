require 'rails_helper'

describe '掲示板管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      faculty_a = FactoryBot.create(
        :faculty,
        id: 20,
        name: 'スポーツ健康科学学部'
      )
      user_a = FactoryBot.create(
        :user, 
        name: 'ユーザーA', 
        email: 'a@ed.ritsumei.ac.jp', 
        password: 'password', 
        faculty: faculty_a
      )
      user_a.confirm
      campus_name_a = FactoryBot.create(
        :campus_name,
        id: 20,
        name: 'アイルランド'
      )
      reward_a = FactoryBot.create(
        :reward,
        id: 20,
        name: '報酬あり'
      )
      FactoryBot.create(
        :board, 
        title: 'Aの実験の募集', 
        abstract: '要約A', 
        detail: '詳細A', 
        campus_name: campus_name_a, 
        laboratory: 'A研究室', 
        start_day: "2020-08-23", 
        finish_day: "2020-08-28", 
        place: 'A棟3階', 
        reward: reward_a, 
        reward_content: '1000円', 
        number: 15, 
        charge: 'Aoki', 
        contact: 'a@ed.ritsumei.ac.jp', 
        endline: "2020-08-28", 
        user: user_a
      )
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in 'Eメール', with: 'a@ed.ritsumei.ac.jp'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it 'ユーザーAが作成した掲示板が表示される' do
        expect(page).to have_content 'Aの実験の募集'
      end
    end
  end

  describe '掲示板作成機能' do

    context 'ユーザーがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in 'Eメール', with: 'a@ed.ritsumei.ac.jp'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it '掲示板(画像なし)が作成できる' do
        expect(page).to have_content ''
      end

      it '掲示板(画像あり)が作成できる' do
        expect(page).to have_content ''
      end
    end
  end

  describe '詳細表示機能' do
    before do
      visit board_path # boardのidが必要！！
    end

    it '募集要項の詳細が表示される' do
      expect(page).to have_content '' # 詳細表示時に出る内容を入れる！！
    end
  end
end
