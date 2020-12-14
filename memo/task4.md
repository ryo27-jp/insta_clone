## テーブル作成  
- アソシエーション  
- バリデーション  
## routing作成  
- shallow  
コレクション (index/new/createのような、idを持たないアクション) だけを親のスコープの下で生成するという手法。  
/posts/:post_id/comments(.:format)   
メンバー (show/edit/update/destroyのような、idを必要とするアクション) をネストに含めないのがポイント。  
comments/:id(.:format)   

https://railsguides.jp/routing.html  
## CRUD作成  
## View作成  
renderの各オプションについて    
collectionが省略されている形が使用されているパターンがあったので展開した時の状態がわかっていないとレンダリング先がイメージ出来ない。  
https://qiita.com/takeru56/items/299850d0f054ce107e21  
- 編集・更新はモーダルで非同期に行う(form_with使用)  
 jqueryの各メソッドは下記で確認。  
 http://semooh.jp/jquery/api/manipulation/prepend/content/  
 http://bootstrap3.cyberlab.info/javascript/modals-javascript-methods.html  

 modal  
 https://getbootstrap.jp/docs/4.2/components/modal/  

 remote: true  
 リクエストがjs形式になる.  
 https://qiita.com/__tambo__/items/45211df065e0c037d032  
