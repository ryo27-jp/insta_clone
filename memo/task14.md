## メタタグ
- ウェブページを記述する文字コードやキーワードといったメタデータをメタ要素としてHTMLタグで記述した部分
メタ要素はname属性やcharaset属性等がある。

## Gem
- meta-tags
  - `` gem 'meta-tags'　``をインストール
  - メタタグはデフォルトで設定が決められているのでそれをオーバーライドするには
    ``` rails g meta_tags:install ```
    これにより`` config/initializers/meta_tags.rb``がつくられる。
  - request.base_url
    https://easyramble.com/rails-request-url-original_url-differences.html



- default_meta_tags/set_meta_tagsのオプションについて
 - canonical
  正式なURLを検索エンジンに伝えるURLの正規化を目的としたもの。
  類似したページがある際に重複したコンテンツが多くあり独自性の低いページとして認識される事を避ける事ができる。

  例えば 色だけ違う商品がそれぞれ独自のURLを持つ場合はコンテンツの内容が色の違いだけなので重複判定をうける。
  その際に優先したいページにcanonicalを設定する。

- og
  OGP(Open Graph Protcol)を設定する為のタグ
  SNS上でシェアした際のタイトルや画像、説明文などを正しく伝える為の要素


## ngrok
https://dashboard.ngrok.com/signup 
https://qiita.com/hirokisoccer/items/7033c1bb9c85bf6789bd
ローカル環境で開発しているサイトをデプロイなしで外部へ公開する事ができる。 

- 行った事
``brew install ngrok``
``ngrok http 3000 ``これはローカルで起動してるポート番号入れてngrokを動かしている。
URLが表示されるのでそこにアクセスする。