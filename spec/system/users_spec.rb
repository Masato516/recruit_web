require 'rails_helper'

RSpec.describe 'アカウント機能', type: :system do
  before do
    @user = User.create!(name: 'first user', email:'first@ed.ritsumei.ac.jp', password:'password', faculty_id: 2)
    @user.confirm
  end

  describe 'アカウント新規作成機能' do
    context 'アカウント作成が成功する場合' do
      it '本人確認用のメールを送信しました と表示される' do
        visit new_user_registration
        fill_in 'Eメール', with: 'second@ed.ritsumei.ac.jp'
        fill_in 'パスワード', with: 'password'
        click_on "新規登録"
        expect(page).to have_content '本人確認用のメールを送信しました'
      end
    end
  end

  describe 'ログイン機能' do
    context 'ログインが成功する場合' do
      it 'ログインしました と表示される' do
        # ログイン画面へ移動
        visit new_user_session_path
        # formにデータを入れてログイン
        fill_in 'Eメール', with: 'first@ed.ritsumei.ac.jp'
        fill_in 'パスワード', with: 'password'
        click_on "ログイン"
        expect(page).to have_content 'ログインしました。'
      end
    end
  end

  describe 'アカウント編集機能' do
    context 'パスワードの編集が成功する場合' do
      it 'アカウント情報を変更しました と表示される' do
        sign_in @user
        visit edit_user_registration_path
        fill_in 'パスワード', with: 'changed'
        expect(page).to have_content ''
      end
    end
  end

end
