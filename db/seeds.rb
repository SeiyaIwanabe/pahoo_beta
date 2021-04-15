# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create!([
  {name: "Hiphop"},
  {name: "Pop"},
  {name: "House"},
  {name: "Break"},
  {name: "Lock"},
  {name: "Enjoyしよう勢"},
])

PostTag.create!([
  {post_tag_name: "ヒップホップ\nHiphop"},
  {post_tag_name: "ブレイク\nBreak"},
  {post_tag_name: "ロック\nLock"},
  {post_tag_name: "ポップ\nPop"},
  {post_tag_name: "ハウス\nHouse"},
  {post_tag_name: "Enjoyしよう勢"},
])

BannerTag.create!([
  {banner_tag_name: "ナンバー募集"},
  {banner_tag_name: "練習会"},
  {banner_tag_name: "レッスン生募集"},
  {banner_tag_name: "コラム記事"},
])

# Banner.create!(
#   [
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'fooナンバー募集',
#     },
#     {
#       banner_name: '調査団メンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#     {
#       banner_name: 'hogehogeナンバー募集',
#     },
#   ]
# )

