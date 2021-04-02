# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Banner.create!(
  [
    {
      banner_name: 'hogehogeナンバー募集',
      banner_tag: 'hiphop好きな人集合',
      banner_image: 'aichi.jpg'
    },
    {
      banner_name: 'fooナンバー募集',
      banner_tag: 'Lock好きな人集合',
      banner_image: 'jenga.jpg'
    },
    {
      banner_name: '調査団メンバー募集',
      banner_tag: '自由を求める人集合',
      banner_image: 'kyoto.jpeg'
    },
    {
      banner_name: 'hogehogeナンバー募集',
      banner_tag: 'タグのテスト投稿です',
      banner_image: 'oosaka.jpg'
    },
    {
      banner_name: 'hogehogeナンバー募集',
      banner_tag: '男だけでワイワイ',
      banner_image: 'nagano.jpg'
    }
  ]
)