class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      # foreign_key: {to_table: :table名}とする事で参照先のテーブル名を指定できる。
      t.references :follower, foreign_key: {to_table: :users}, null: false
      t.references :followed, foreign_key: {to_table: :users}, null: false

      t.timestamps
    end
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
