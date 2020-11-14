require 'rails_helper'

RSpec.describe EndUser, type: :model do
  context "データが正しく保存される" do
    before do
      @end_user = EndUser.new
      @end_user.title = "Hello WebCamp"
      @end_user.content = "今日も晴れです。"
      @end_user.save
    end
    it "全て入力してあるので保存される" do
      expect(@end_user).to be_valid
    end
    context "データが正しく保存されない" do
      before do
        @end_user = Post.new
        @end_user.title = ""
        @end_user.content = "今日も晴れです。"
        @end_user.save
      end
      it "titleが入力されていないので保存されない" do
        expect(@end_user).to be_invalid
        expect(@end_user.errors[:title]).to include("can't be blank")
      end
    end
    endend