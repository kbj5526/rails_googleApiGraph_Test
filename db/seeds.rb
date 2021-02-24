# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    name: "テスト太郎1",
    gender: 0
)
User.create!(
    name: "テスト太郎2",
    gender: 0
)
User.create!(
    name: "テスト太郎3",
    gender: 0
)
User.create!(
    name: "テスト太郎4",
    gender: 0
)
User.create!(
    name: "テスト太郎5",
    gender: 0
)
User.create!(
    name: "テスト太郎6",
    gender: 0
)
User.create!(
    name: "テスト太郎7",
    gender: 0
)

Access.create!(
    user_id: User.find(1).id,
    access_date: "2020-07-20"
)
Access.create!(
   user_id: User.find(2).id,
   access_date: "2020-07-20"
)
Access.create!(
   user_id: User.find(3).id,
   access_date: "2020-07-20"
)
Access.create!(
   user_id: User.find(4).id,
   access_date: "2020-07-20"
)
Access.create!(
   user_id: User.find(5).id,
   access_date: "2020/07/20"
)
Access.create!(
    user_id: User.find(6).id,
    access_date: "2020/07/20"
)

Access.create!(
    user_id: User.find(1).id,
    access_date: "2020-08-20"
)
Access.create!(
   user_id: User.find(2).id,
   access_date: "2020-08-20"
)
Access.create!(
   user_id: User.find(4).id,
   access_date: "2020-08-20"
)
Access.create!(
    user_id: User.find(6).id,
    access_date: "2020/08/20"
)

Device.create!(
    user_id: User.find(1).id,
    device_name: "モバイル"
)
Device.create!(
    user_id: User.find(2).id,
    device_name: "モバイル"
)
Device.create!(
    user_id: User.find(3).id,
    device_name: "モバイル"
)
Device.create!(
    user_id: User.find(4).id,
    device_name: "PC"
)
Device.create!(
    user_id: User.find(5).id,
    device_name: "PC"
)
Device.create!(
    user_id: User.find(6).id,
    device_name: "タブレット"
)

