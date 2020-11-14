class PageTagmap < ApplicationRecord
  belongs_to :page
  belongs_to :page_tag

  validates :page_id, presence: true
  validates :page_tag_id, presence: true
end
