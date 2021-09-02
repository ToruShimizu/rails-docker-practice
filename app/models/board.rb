# bordsテーブルに定義されたデータを扱うことができる
# DBテーブルのレコードをプログラムのオブジェクトとして扱う機能をORマッパーと呼ぶ
class Board < ApplicationRecord
# presenceは必須かどうか
  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
