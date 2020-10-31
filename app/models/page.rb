class Page < ApplicationRecord

  belongs_to :chapter

  # gem ranked-modelによるドラッグ&ドロップ機能
  include RankedModel
  ranks :row_order

end
