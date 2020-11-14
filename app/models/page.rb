class Page < ApplicationRecord
  belongs_to :note
  has_many :page_comments, dependent: :destroy
  has_many :page_favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # タグ付け(中間テーブルあり)
  has_many :page_tagmaps, dependent: :destroy
  has_many :page_tags, through: :page_tagmaps

  # gem ranked-modelによるドラッグ&ドロップ機能
  include RankedModel
  ranks :row_order, with_same: :note_id

  # 「いいね」したかどうかの判定用
  def favorited_by?(end_user)
    page_favorites.where(end_user_id: end_user.id).exists?
  end

  # タグ付け機能
  def save_tags(page_tags)
    current_tags = self.page_tags.pluck(:name) unless self.page_tags.nil?
    old_tags = current_tags - page_tags
    new_tags = page_tags - current_tags

    # Destroy
    old_tags.each do |old_name|
      self.page_tags.delete PageTag.find_by(name: old_name)
    end

    # Create
    new_tags.each do |new_name|
      new_page_tag = PageTag.find_or_create_by(name: new_name)
      self.page_tags << new_page_tag
    end
  end

  # 通知機能
  def create_notification_like!(current_end_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(['visitor_id = ? and visited_id = ? and page_id = ? and action = ? ', current_end_user.id, note.end_user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_end_user.active_notifications.new(
        page_id: id,
        visited_id: note.end_user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      notification.is_checked = true if notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_end_user, page_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = PageComment.select(:end_user_id).where(page_id: id).where.not(end_user_id: current_end_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_end_user, page_comment_id, temp_id['end_user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_end_user, page_comment_id, note.end_user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_end_user, page_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_end_user.active_notifications.new(
      page_id: id,
      page_comment_id: page_comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    notification.is_checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
