# require 'rails_helper'
#
# RSpec.describe Board, type: :model do
#   describe "boardの投稿" do
#
#     let(:board) { Board.new(title, abstract, detail, campus_name_id, laboratory, start_day, finish_day, place, reward_id, reward_content, number, charge, contact, endline, user_id) }
#     #
#     title = "〇〇実験の募集",
#     abstract = "事前測定（VO2測定）、運動負荷（バイク運動）、アクチグラフの装着、サプリメントの摂取を２週間のウォッシュアウト期間を挟んで２度実施(合計9度の来室)する予定です。 ・事前測定 VO2max測定(約60分間) ・1、8日目 VO2max70%での60分のペダリング運動とBIODEXでの筋力測定(約100分間) ・2、9日目　　BIODEXでの筋力測定(約20分間) ・8日間の就寝前のサプリメント摂取 ・８日間のアクチグラフの装着(身体活動量、睡眠の計測) を行ってもらう予定です。 【遵守事項】 食品摂取期間中は、食事習慣・飲酒習慣・運動習慣・就寝リズム等の生活習慣を大きく変えない。 運動負荷試験3日前〜前日および介入期間中は、日常生活範囲を逸脱するような高強度の運動は禁止する。 運動負荷試前日の夕食は、午後7時～9時の間に支給された規定食を摂取する。 謝礼金としては20,000円の予定で、11月から事前測定、1月から本測定",
#     detail = "",
#     campus_name_id = 1,
#     laboratory = "〇〇研究室",
#     start_day = "2020-08-23",
#     finish_day = "2020-10-31",
#     place = "インテグレーション3階",
#     reward_id = 1,
#     reward_content = "20000円",
#     number = 15,
#     charge = "八木雅斗",
#     contact = "yagixxx@gmail.com",
#     endline = "2020-10-01"
#     user_id = 2
#
#     context "全ての値が入っている場合" do
#       post
#     end
#     context "タイトルが空白の場合" do
#       let(:title) { "" }
#     end
#     context "概要が空白の場合" do
#       let(:abstract) { "" }
#     end
#     context "詳細が空白の場合" do
#       let(:detail) { "" }
#     end
#     context "研究室名が空白の場合" do
#       let(:campus_name_id) { "" }
#     end
#     context "実験実施期間の開始日が空白の場合" do
#       let(:start_day) { "" }
#     end
#     context "実験実施期間の終了日が空白の場合" do
#       let(:finish_day) { "" }
#     end
#     context "実験実施場所が空白の場合" do
#       let(:place) { "" }
#     end
#     context "報酬idが空白の場合" do
#       let(:reward_id) { "" }
#     end
#     context "報酬内容が空白の場合" do
#       let(:reward_content) { "" }
#     end
#     context "被験者数が空白の場合" do
#       let(:number) { "" }
#     end
#     context "責任者が空白の場合" do
#       let(:charge) { "" }
#     end
#     context "連絡先が空白の場合" do
#       let(:contact) { "" }
#     end
#     context "募集締切日が空白の場合" do
#       let(:endline) { "" }
#     end
#     context "user_idが空白の場合" do
#       let(:user_id) { "" }
#     end
#   end
# end

FactoryBot.define do
  factory :board do
    title { '〇〇実験の募集' }
    abstract { '要約' }
    detail { '詳細' }
    laboratory { '〇〇研究室' }
    start_day { "2020-08-23" }
    finish_day { "2020-08-28" }
    place { 'インテグ３階' }
    reward_id { 2 }
    reward_content { '図書カード１０００円' }
    number { 10 }
    charge { '八木' }
    contact { 'yaginen10@gmail.com' }
    endline { "2020-10-01" }
    user
    campus_name
    reward
  end
end
