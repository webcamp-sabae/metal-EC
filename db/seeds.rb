

Genre.create!(genre: 'ニュー・メタル')
Genre.create!(genre: 'ブラックメタル')
Genre.create!(genre: 'メタルコア')
Genre.create!(genre: 'デスメタル')
Genre.create!(genre: 'ドゥーム・メタル')
Genre.create!(genre: 'ビートダウン')
Genre.create!(genre: 'デスコア')
Genre.create!(genre: 'ハードコア')
Genre.create!(genre: 'スラッシュ・メタル')

Label.create!(label: 'EMI')
Label.create!(label: 'ワーナー・ミュージック・グループ')
Label.create!(label: 'ソニー・ミュージック・エンタテインメント')
Label.create!(label: 'ユニバーサル・ミュージック・グループ')

# 商品を作成
5.times do
  artist = Artist.create!(
    artist_name: Faker::Music.band
  )

  3.times do |i|
    date1 = Date.new(1990,1,1)
    cd = Cd.create!(
      artist_id: artist.id,
      label_id: [*1..4].sample,
      genre_id: [*1..9].sample,
      release: date1 + i,
      price: [1000,2000,3000].sample,
      stock: 10,
      cd_image_id: nil,
      single_album_name: Faker::Music.album
    )

    6.times do |j|
      Song.create!(
        cd_id: cd.id,
        disc_num: 1,
        song_title: "#{cd.single_album_name}-#{j + 1}"
      )
    end
  end
end

10.times do |i|

  user =  User.create!(
    email: "sample#{i}@example.com",
    familyname: Faker::Japanese::Name.first_name,
    firstname: Faker::Japanese::Name.last_name,
    kana_familyname: 'メタル',
    kana_firstname: 'タロウ',
    telephone_number1: '090',
    telephone_number2: [*'0000'..'9999'].sample,
    telephone_number3: [*'0000'..'9999'].sample,
    first_postal_code: "150",
    last_postal_code: "0001",
    statu_address: ['東京都', '大阪府', '北海道','沖縄県'].sample,
    city_address: '渋谷区渋谷1-1-1',
    street_address: ['', '山田アパート101','鈴木マンション202','田中ハイツ303'].sample,
    password: 'password'
  )

  [*0..3].sample.times do
    Cart.create!(
      cd_id: [*1..15].sample,
      user_id: user.id,
      amount: [*1..3].sample
    )
  end

  [*0..3].sample.times do
    set_date = Time.now - [0,7,30].sample.day
    receipt = Receipt.create!(
      user_id: user.id,
      shipping_familyname: user.familyname,
      shipping_firstname: user.firstname,
      shipping_kana_familyname: user.kana_familyname,
      shipping_kana_firstname: user.kana_firstname,
      shipping_postal: user.postal_code,
      shipping_address: user.address,
      shipping_telephone_number: user.telephone_number,
      payment: [*1..3].sample,
      status: [*1..2].sample,
      postage: 500,
      created_at: set_date,
      updated_at: set_date
    )

    [*1..3].sample.times do
      Purchase.create!(
        cd_id: [*1..15].sample,
        receipt_id: receipt.id,
        purchase_price: [1000,2000,3000].sample,
        amount: [*1..3].sample,
        created_at: set_date
      )
    end
  end
end

# # 別の届け先を登録して商品を購入
#
# Othersaddress.create!(
#   user_id: 1,
#   familyname: '目立留',
#   firstname: 'の母',
#   kana_familyname: 'メタル',
#   kana_firstname: 'ノハハ',
#   telephone_number1: '090',
#   telephone_number2: '0002',
#   telephone_number3: '0330',
#   first_postal_code: '464',
#   last_postal_code: '2772',
#   statu_address: '東京都',
#   city_address: '新宿区',
#   street_address: '新宿15-6-1'
# )
