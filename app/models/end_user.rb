class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy
  has_many :page_comments
  has_many :page_favorites, dependent: :destroy

  # フォロー機能
  has_many :end_user_relationships
  has_many :followings, through: :end_user_relationships, source: :follow
  has_many :reverse_of_end_user_relationships, class_name: 'EndUserRelationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_end_user_relationships, source: :end_user

  def follow(other_user)
    end_user_relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = end_user_relationships.find_by(follow_id: other_user.id)
    relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # フォロー通知用メソッド
  def create_notification_follow!(current_end_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_end_user.id, id, 'follow'])
    if temp.blank?
      notification = current_end_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # gem refileによる画像投稿機能
  attachment :image

  # 検索機能
  def self.search(search, word)
    @end_users = case search
                 when 'perfect_match'
                   EndUser.where(name: word.to_s)
                 when 'forward_match'
                   EndUser.where('name LIKE ?', "#{word}%")
                 when 'backward_match'
                   EndUser.where('name LIKE ?', "%#{word}")
                 when 'partial_match'
                   EndUser.where('name LIKE ?', "%#{word}%")
                 else
                   EndUser.all
                 end
  end
end
