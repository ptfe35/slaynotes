class Notification < ApplicationRecord
  # スコープ(新着順にする)
  default_scope -> { order(created_at: :desc) }

  belongs_to :note, optional: true
  belongs_to :page, optional: true
  belongs_to :page_comment, optional: true
  belongs_to :visitor, class_name: 'EndUser', optional: true
  belongs_to :visited, class_name: 'EndUser', optional: true
end
