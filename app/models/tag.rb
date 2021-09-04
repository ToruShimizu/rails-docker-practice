# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  # 一つのタグが複数のボードタグのリレーションを持つ
  # dependentはdestoryメソッドにする必要がある
  has_many :board_tag_relations, dependent: :delete_all
  # 一つのタグが複数の掲示板を持つ
  # throughはboard_tag_relationsという中間テーブルを紐づける
  has_many :boards, through: :board_tag_relations
end
