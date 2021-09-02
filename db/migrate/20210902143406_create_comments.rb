class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      # 関連する、foreignキーは外部キー
      t.references :board, foreign_key: true
      t.string :name, null: false
      t.text :comment, null: falsea

      t.timestamps
    end
  end
end
