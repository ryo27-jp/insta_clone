## follow機能  
## Model作成  
:to_tableオプション  
https://qiita.com/kymmt90/items/03cb9366ff87db69f539  
relationshipsテーブルは中間テーブルだが、保存する外部キーはどちらもusersテーブルのid  
その為カラム名から参照テーブルを推定出来ない命名にする事がある為に:to_tableオプションを使用して明示的に参照先を指定する。
- 関連付け  
https://hajimeteblog.com/rails-follow/  
```
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォローしている人
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォローされている人
  has_many :following, through: :follower, source: :followed # 自分がフォローしている人
  has_many :followers, through: :followed, source: :follower 
  ```

関連付けしているモデルも実際にあるモデルではない為sorceオプションで関連モデルをforeign_keyで参照カラムを明示的に指定する

上手く命名しないと機能を実装する時にとても混乱します笑

## ルーティング作成  
## コントローラー作成  
relationships_controller  
user.rbで定義したメソッドを使用してフォローアンフォローを実装

  ```
  def follow(other_user)
    follower.create(followed_id: other_user.id)
  end
  ```
  ```
    def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end
  ```
  current_userのidとviewから受け取ったfollowed_idをrelationshipsテーブルに保存する事でフォローとしている。  
  destroyアクションでアンフォロー


## Views作成  
RAND関数  
あまり推奨されていないらしいパフォーマンスが低下する事が理由？