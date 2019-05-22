# 商品を作成
Artist.create!(artist_name: 'SLIPKNOT')

Genre.create!(genre: 'hard-metal')

Label.create!(label: 'Roadrunner Records')

Cd.create!(artist_id: 1, label_id: 1, genre_id: 1, release: '2014-10-21',
   price: 1916, stock: 10, cd_image_id: nil, single_album_name: 'The Gray Chapter')

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


# 新規会員登録して複数商品を購入
User.create!(
  email: "metal-taro@example.com",
  familyname: '目立留',
  firstname: '太郎',
  kana_familyname: 'メタル',
  kana_firstname: 'タロウ',
  telephone_number1: '090',
  telephone_number2: '0000',
  telephone_number3: '0000',
  first_postal_code: "150",
  last_postal_code: "0001",
	statu_address: '東京都',
	city_address: '渋谷区渋谷1-1-1',
	street_address: '',
  password: 'password'
)

Cart.create!(
  cd_id: 1,
  user_id: 1,
  amount: 1
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

Purchase.create!(
  cd_id: 1,
  receipt_id: 1,
  purches_price: 1916,
  amount: 1
)

#
Purchase.create!(
  cd_id: 1,
  receipt_id: 1,
  purches_price: 1916,
  amount: 1
)


# 発送済：　商品購入
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
  status: 2,
  postage: 500
)

Purchase.create!(
  cd_id: 1,
  receipt_id: 2,
  purches_price: 1916,
  amount: 1
)


# 別の届け先を登録して商品を購入

Othersaddress.create!(
  user_id: 1,
  familyname: '目立留',
  firstname: 'の母',
  kana_familyname: 'メタル',
  kana_firstname: 'ノハハ',
  telephone_number1: '090',
  telephone_number2: '0002',
  telephone_number3: '0330',
  first_postal_code: '464',
  last_postal_code: '2772',
  statu_address: '東京都',
  city_address: '新宿区',
  street_address: '新宿15-6-1'
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

Purchase.create!(
  cd_id: 1,
  receipt_id: 3,
  purches_price: 1916,
  amount:1
)

# User2を作成
User.create!(
  email: "metal-hanako@example.com",
  familyname: '蛇忌',
  firstname: '花子',
  kana_familyname: 'ヘビイ',
  kana_firstname: 'ハナコ',
  telephone_number1: '090',
  telephone_number2: '8888',
  telephone_number3: '8888',
  first_postal_code: "160",
  last_postal_code: "0001",
	statu_address: '神奈川県',
	city_address: '横浜市港区港1-1-1',
	street_address: '半角スペース    1',
  password: 'password'
)

User.create!(
  email: "rock-jiro@example.com",
  familyname: '六供',
  firstname: '次郎',
  kana_familyname: 'ロック',
  kana_firstname: 'ジロウ',
  telephone_number1: '090',
  telephone_number2: '8888',
  telephone_number3: '8888',
  first_postal_code: "560",
  last_postal_code: "0001",
	statu_address: '大阪府',
	city_address: '大阪市北区梅田１−１−１',
	street_address: '全角スペース　　　　あ',
  password: 'password'
)
