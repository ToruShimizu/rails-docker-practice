class Comment < ApplicationRecord
  # ボードに紐づく
  belongs_to :board
end
