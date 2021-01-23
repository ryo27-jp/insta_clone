## ルーティング
https://railsguides.jp/routing.html
## コントローラー
## モデル
検索用にscopeを定義
```
scope :body_contain, ->(word) { where('body LIKE ?', "%#{word}%") }
```
- SQLのLIKE句　　 
- プレースホルダー  
  - https://qiita.com/Morinikiz/items/dfdb33f25df4df0f672c  
  - SQLインジェクションを防ぐ事ができる。  
  - 送られてきたパラメーターを使用する前にSQLの構文を確定させておく事で、入力されたパラメーターでSQL文を想定していない文へ変更されない。  
- ワイルドカード  
  - % 任意の文字列  %木%→ 木村　鈴木  
  - _  任意の1文字 _木% →　鈴木　高木  

- StrongParameters
 - https://qiita.com/mochio/items/45b9172a50a6ebb0bee0  
```
  def search_post_params
    params.fetch(:q, {}).permit(:body, :comment_body, :username)
  end
```
- params.fetch(key,default)で受け取ったkeyが空だった場合にエラーではなくdefaultを返す。  
- params.require(key)はkeyがなければ例外ActionController::ParameterMissingを発生させる
- .permit(filter)はStorngParametersで許可するカラム
## FormObject
- https://tech.medpeer.co.jp/entry/2017/05/09/070758　　
- scope = splited_bodies.map { |splited_body| scope.body_contain(splited_body) }.inject { |result, scp| result.or(scp) } if body.present?　　
  - inject以降は何をしているか　　

  - POSIX 文字クラス http://www.kt.rim.or.jp/~kbk/regex/regex.html　　
  - .strip  
  - .split https://docs.ruby-lang.org/ja/latest/method/String/i/strip.html  
## View    
