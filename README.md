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

<br>
<br>

# インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/67876040/118015001-c2365280-b38e-11eb-812d-afebc19542dc.png)

<br>
<br>

# DB設計図
<img width="875" alt="スクリーンショット 2021-04-29 15 41 54" src="https://user-images.githubusercontent.com/67876040/118015294-15100a00-b38f-11eb-81e3-f39177accab0.png">

# こだわりポイント

1. **ユーザーによる動画のコントロール機能(再生/停止,音声のon/off,プログレスバー)**
2. **ユーザーが相互フォロー時にダイレクトメッセージ機能が開放される**
3. **ユーザーの様々なアクションに対して通知で知らせる**

<br>
<br>

## 1. ユーザーによる動画のコントロール機能
投稿された動画はユーザーがコントローラブルに操作することができます。具体的には再生/停止,音声のon/off,プログレスバーの表示です。JavascriptのDOM操作によって実現をしています。

<br>

**イメージ動画**
<br>

![ezgif com-gif-maker (11)](https://user-images.githubusercontent.com/67876040/118081524-7d460680-b3f6-11eb-9c2c-4f31f24f5b4d.gif)

