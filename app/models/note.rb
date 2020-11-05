class Note < ApplicationRecord

  belongs_to :end_user
  has_many :pages, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # gem refileによる画像投稿機能
  attachment :image

  # gem ranked-modelによるドラッグ&ドロップ機能
  include RankedModel 
  ranks :row_order , with_same: :end_user_id 

  # 検索機能
  def self.search(search,word)
    if search == "perfect_match"
      @notes = Note.where(name: "#{word}")
    elsif search == "forward_match"
      @notes = Note.where("name LIKE ?","#{word}%")
    elsif search == "backward_match"
      @notes = Note.where("name LIKE ?","%#{word}")
    elsif search == "partial_match"
      @notes = Note.where("name LIKE ?","%#{word}%")
    else
      @notes = Note.all
    end
  end

end
