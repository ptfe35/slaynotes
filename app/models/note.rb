class Note < ApplicationRecord
  belongs_to :end_user
  has_many :pages, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # gem refileによる画像投稿機能
  attachment :image

  # gem ranked-modelによるドラッグ&ドロップ機能
  include RankedModel
  ranks :row_order, with_same: :end_user_id

  # 検索機能
  def self.search(search, word)
    @notes = case search
             when 'perfect_match'
               Note.where(name: word.to_s)
             when 'forward_match'
               Note.where('name LIKE ?', "#{word}%")
             when 'backward_match'
               Note.where('name LIKE ?', "%#{word}")
             when 'partial_match'
               Note.where('name LIKE ?', "%#{word}%")
             else
               Note.all
             end
  end
end
