## model
- ポリモーフィック  
　一つのモデルを同じインターフェースを持ったものが扱う場合に有効な関連付けで、今回の場合はActivityモデルを扱う場合の関連付けを行っている。  
　インターフェースとは決まった振る舞い、今回のケースでいう通知がそれにあたる。  
　それを単純に実装する場合は複数の関連付けと外部キーを持つカラムが必要となるが、ポリモーフィック関連を使用した場合は下記の様に実装できる。  

```t.references :subject, polymorphic: true```とする事で``` t.string "subject_type"  
    t.bigint "subject_id"```カラムが生成される。  
    ```
    # 関連のモデル名を保存(コメントされたら"Comment"等)  
    t.string "subject_type"  
    # 関連モデルのidを保存(idが5のレコードなら5が保存される)
    t.bigint "subject_id"
    t.bigint "user_id"
    # Activityモデルのenumで定義されてるタイプがcreateされたモデルのafter_create_commitによってintで入る）
    ```
- モデルでurl_helperを使用する。  
  url_helperはView、コントローラーでしか使用できない。  
  modelで呼び出す場合は``` include Rails.application.routes.url_helpers```等をする必要がある。  
    https://qiita.com/jerrywdlee/items/f91c9ea01055cb74083c  
## View
-　Layoutファイルについて
 layoutはRailsは現在のレイアウトを探索する場合、最初に現在のコントローラと同じ基本名を持つレイアウトがapp/views/layoutsディレクトリにあるかどうかを調べます。たとえば、PhotosControllerクラスのアクションから出力するのであれば、app/views/layouts/photos.html.erbまたはapp/views/layouts/photos.builderを探します。該当のコントローラに属するレイアウトがない場合、app/views/layouts/application.html.erbという順番になる。　　
 　　
 今回の場合はBaseコントローラーでLayoutを指定していたがそれを失念していて継承漏れに気づくのに時間を要した。　　
