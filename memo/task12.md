## Active Job
- Railsアプリケーションにジョブ管理インフラを配置する事を目的としている。  
  ジョブの実行機能のAPIの違いを気にせずジョブフレームワークやgemを搭載す事ができる様になる。  
  ジョブ管理フレームワークを切り替える際にジョブを書き直さなくて良い。
- Railsが提供するのは、ジョブをメモリに保持するインプロセスのキューイングシステムだけで再起動などをするとすべて失われる。  
  それを解消する為にライブラリ固有のキューイングシステムを起動しておく。( Sidekiq等)
  https://railsguides.jp/active_job_basics.html

# Sidekiq
- 非同期処理を行いたい時に使うライブラリ。  
https://github.com/mperham/sidekiq
# redis
- ジョブをキューイングする為に必要。  
  永続化可能なインメモリデータベース。
  インメモリベースのデータストアを導入する際の懸念として，クラッシュした際にデータが消えてしまうという問題があります。  
  Redisは永続化の機構を実装しており，インメモリの高速性を持ちながら，同時にディスクベース・データストアの永続性をも備えているのが特徴。  
- インメモリ型データ構造ストア
https://redis.io/
https://gihyo.jp/dev/feature/01/redis/0001
## キュー
- データ構造の１つ  
  待ち行列や先入先出し(first-in firstout/FIFO)と言われる管理方式で要は先に入れられたものから順番に実行される。  
  実際は列を作るわけでないらしい。すべての要素を1つずらすって処理が非効率だから。
  反対の管理方法をとるデータ構造は(スタック)と呼ばれる
- エンキュー/デキュー
 要素を追加と取り出し
- キューイング
  キューを用いて要素の管理を行う事
- ジョブ管理  
非同期的に処理を実行したい場合にジョブ（行いたい処理)をキューに登録する事  
 ## 実装
```
Gem sidekiq  
Gem sinatra  
bundle
```
sidekiqのキューイングに``redis``が必要
Homebrew等でinstall

管理画面用にルーティングの設定。
デフォルト以外にキューを追加する場合は``config/sidekiq.yml``に設定　　
https://github.com/mperham/sidekiq/wiki/Advanced-Options　　

```
redis-server
<!-- sidekiq.ymlを作っていた場合 -->
bundle exec sidekiq -C config/sidekiq.yml
```
# 管理画面はアクセスするとセッションが切れます
``http://localhost:3000/sidekiq``

流れ
https://qiita.com/yumiyon/items/6835d90e621e73268021


