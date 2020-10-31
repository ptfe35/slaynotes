class Note < ApplicationRecord

  belongs_to :end_user
  has_many :chapters, dependent: :destroy

  # gem ranked-modelによるドラッグ&ドロップ機能
  include RankedModel 
  ranks :row_order , with_same: :end_user_id 

end
