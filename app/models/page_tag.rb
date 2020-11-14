class PageTag < ApplicationRecord
  has_many :page_tagmaps, dependent: :destroy
  has_many :pages, through: :page_tagmaps
end
