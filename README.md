# アプリケーション概要
Ruby on RailsでCRUD処理を実装した、ダンサーにフォーカスしたSNSマッチングアプリです。
<br>
10代~20代中盤の学生ダンサーや社会人ダンサーをメインターゲットとして、サービスを設計しました。
<br>
僕自身、大学からダンスを始めましたが、外部のつながりを作りにくいという課題を感じていました。
<br>
この課題を解決できないかと考え、アプリケーション制作に取り組みました。
<br>
<br>

<img width="428" alt="スクリーンショット 2021-05-12 20 29 50" src="https://user-images.githubusercontent.com/67876040/117968215-ea0ec180-b360-11eb-9c84-c3b81ffaee87.png">

ドメイン名: [http://pahoo-beta.work/](http://pahoo-beta.work/)
<br>
<br>

# 機能要件

- ユーザー認証
- プロフィール編集
- 動画投稿
- 投稿へのコメント(非同期通信)
- 投稿へのいいね(非同期通信)
- ユーザーのフォロー
- ユーザー間のダイレクトメッセージ
- 通知機能
- Twitter APIを用いた投稿の共有
- モバイルファーストのレスポンシブデザイン(980px以上の場合に適用)

# 使用言語・技術一覧
**フロントエンド**

- HTML
- Sass
- Javascript(一部jQuery使用)

**バックエンド**

- Ruby 2.6.5
- Ruby on Rails 5.2

**テスト**

- Rspec

**自動デプロイ**

- Capistrano

**Linter/Fomatter**

- Prettier
- Rubocop

**データベース**

- ローカル環境: Mysql 5.6
- 本番環境: MariaDB

**アプリケーションサーバー**

- Unicorn

**Webサーバー**

- Nginx

**インフラ**

- AWS(VPC,EC2,IAM,Route53)
- Docker(ローカル環境)

**その他のツール**

- Visual Studio Code
- Trello
- Lucidchart
- DeepL
- Responsively

# インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/67876040/118015001-c2365280-b38e-11eb-812d-afebc19542dc.png)

# DB設計図
<img width="875" alt="スクリーンショット 2021-04-29 15 41 54" src="https://user-images.githubusercontent.com/67876040/118015294-15100a00-b38f-11eb-81e3-f39177accab0.png">


