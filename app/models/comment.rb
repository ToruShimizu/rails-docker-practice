class Comment < ApplicationRecord
  # ボードに紐づく
  belongs_to :board

  validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000 }
end
