## 1.postのルーティング作成  
## 2.Postモデル作成  
## 3.imagemagick
  imagemagickはyarnで導入した。
  mini_magickは画像のリサイズに活用するGem  
  imagemagickが導入されていないと使用できない。  
  carrierwaveで作成するuploderにincludeして使用する。  
  参考:https://qiita.com/nekotanku/items/5da43600f35eada64eac  
  参考:https://rubydoc.info/gems/carrierwave/CarrierWave/MiniMagick
## 4.carrierwave
  画像のアップロードを行う為のGem  
  uploderを作成できる様になり、それを画像のURLを保存するカラムを作ったモデルと関連付ける  
  参考:https://pikawaka.com/rails/carrierwave  
  画像を複数枚投稿する場合にはuploderの関連付けを行う際に mount_uploaders とする必要がある。  
  serializeメソッドを使う事で1つのカラムに複数の画像URLを保存している.  
  参考:https://qiita.com/jnchito/items/68e91e9bf46f960a79e4
## 5.swiper
  今回一番詰まった所  
  yarn add swiperで導入。  
  application.jsでファイルの読み込みの記述を行う.  
  その後新規でswiper.jsファイルを作成する。  
  公式のDeomoにHTMLやCSSのソースがある。  
  参考:https://swiperjs.com/demos/#fraction_pagination    
  swiper.js(今回の場合)の発火タイミングを調整しなければ上手く稼働しない。    
  -今回の場合jQueryを用いてDOMの準備が終わってから実行される様にしている。  
  参考:http://semooh.jp/jquery/api/core/jQuery/callback/    
  みけたさんの記事参考に進めた。  
  参考:https://qiita.com/miketa_webprgr/items/0a3845aeb5da2ed75f82  
## 6.CRUD機能を作成  
  gem sorceryを使用している為、current_userやrequire_login等のメソッドを使用する事が可能。  
  参考:https://github.com/Sorcery/sorcery/tree/7c5fee441e03779ee2888ecef317440cd10a17e7/lib/sorcery  
  includesメソッドを使用する事でN+1問題を解消する。  
  参考:https://pikawaka.com/rails/includes  
## 7.faker  
  ダミーデータを生成してくれるGemでseedファイルの作成等で使われる事が多い。  
  様々なダミーデータがgithubで確認できる。  
  参考:https://github.com/faker-ruby/faker  

## ポイント  
課題1からずっと詰まってるdatabase.ymlについて  
.gitignoreでの管理を誤って重要なファイルをgitにあげてしまうと大惨事なので  
今回の事で少しでも理解を深めておく必要がある。  
課題2でpushされてしまった原因はおそらく1度gitに上がってしまったファイルだったからだと思われる。  
参考:https://qiita.com/anqooqie/items/110957797b3d5280c44f  
githubのコミット履歴から消す方法は今のところ上手くいっていない。  
参考:https://qiita.com/Spring_MT/items/f60c391b5dbf569a1d12
ブランチ切って序盤に油断して一括でgit add してしまった気がするので反省！