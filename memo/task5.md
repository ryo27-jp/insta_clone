## 中間テーブル作成
      t.index [:user_id, :post_id], unique: true
      t.index [:user_id, :post_id], unique: true
## モデル
関連付け  
https://qiita.com/j-sunaga/items/d7f0e944baad6e56206c
userモデルへメソッド追加  
バリデーション  
https://qiita.com/j-sunaga/items/d7f0e944baad6e56206c  
validates :〇〇　uniqueness:　{scope :××}  
とする事で××は〇〇を１つしか持てなくなる.  
## routing作成
## コントローラー作成
## view
