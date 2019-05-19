# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(:familyname => "山田", :firstname => "太郎", :kana_familyname => "ヤマダ", :kana_firstname => "タロウ", :postal_code => "123", :telephone_number => "090", :email => "example@yahoo.co.jp")
#
# # Othersaddress.create(:user_id => "1", :familyname => "山田", :firstname => "太郎", :kana_familyname => "ヤマダ", :kana_firstname => "タロウ", :telephone_number => "090", :postal_code => "", :address => "東京都")
#
# Cart.create(:user_id => "1", :cd_id => "1", :amount => "2")
#
#

# 商品を作成
Artist.create!(artist_name: 'SLIPKNOT')

Genre.create!(genre: 'hard-metal')

Label.create!(label: 'Roadrunner Records')

Cd.create!(artist_id: 1, label_id: 1, genre_id: 1, release: '2014-10-21',
   price: 1916, stock: 10, cd_image: nil, single_album_name: 'The Gray Chapter')

Song.create!(cd_id: 1, disc_num: 1, song_title: 'XIX')
Song.create!(cd_id: 1, disc_num: 1, song_title: 'Sarcastrophe')
Song.create!(cd_id: 1, disc_num: 1, song_title: 'AOV')
Song.create!(cd_id: 1, disc_num: 1, song_title: 'The Devil In I')
Song.create!(cd_id: 1, disc_num: 1, song_title: 'Killpop')
Song.create!(cd_id: 1, disc_num: 1, song_title: '6')
Song.create!(cd_id: 1, disc_num: 1, song_title: '7')
Song.create!(cd_id: 1, disc_num: 1, song_title: '8')
Song.create!(cd_id: 1, disc_num: 1, song_title: '9')
Song.create!(cd_id: 1, disc_num: 1, song_title: '10')
Song.create!(cd_id: 1, disc_num: 1, song_title: '11')
Song.create!(cd_id: 1, disc_num: 1, song_title: '12')
Song.create!(cd_id: 1, disc_num: 1, song_title: '13')
Song.create!(cd_id: 1, disc_num: 1, song_title: '14')


# 会員登録して商品を購入
User.create!(
  email: "metal-taro@example.com",
  familyname: '目立留',
  firstname: '太郎',
  kana_familyname: 'メタル',
  kana_firstname: 'タロウ',
  telephone_number: '09000000000',
  postal_code: '1500001',
  address: '東京都渋谷区渋谷1-1-1',
  password: 'password'
)

Othersaddress.create!(
  user_id: 1,
  familyname: '目立留',
  firstname: 'の母',
  kana_familyname: 'メタル',
  kana_firstname: 'ノハハ',
  telephone_number: '09012345678',
  postal_code: '5300001',
  address: '大阪府大阪市北区梅田1-1-1'
)

Cart.create!(
  cd_id: 1,
  user_id: 1,
  amount: 1
)

Purchase.create!(
  cd_id: 1,
  receipt_id: 1,
  purches_price: 1916
)

user = User.first

Receipt.create!(
  user_id: user.id,
  shipping_familyname: user.familyname,
  shipping_firstname: user.firstname,
  shipping_kana_familyname: user.kana_familyname,
  shipping_kana_firstname: user.kana_firstname,
  shipping_postal: user.postal_code,
  shipping_address: user.address,
  shipping_telephone_number: user.telephone_number,
  payment: 1,
  status: 1,
  postage: 500
)

anothers = user.othersaddresses
another = anothers.first

Receipt.create!(
  user_id: another.id,
  shipping_familyname: another.familyname,
  shipping_firstname: another.firstname,
  shipping_kana_familyname: another.kana_familyname,
  shipping_kana_firstname: another.kana_firstname,
  shipping_postal: another.postal_code,
  shipping_address: another.address,
  shipping_telephone_number: another.telephone_number,
  payment: 1,
  status: 1,
  postage: 500
)
