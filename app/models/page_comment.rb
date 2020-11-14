class PageComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :page

  has_many :notifications, dependent: :destroy
end
