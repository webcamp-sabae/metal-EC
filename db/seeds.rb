# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:familyname => "山田", :firstname => "太郎", :kana_familyname => "ヤマダ", :kana_firstname => "タロウ", :postal_code => "123", :telephone_number => "090", :email => "example@yahoo.co.jp")

# Othersaddress.create(:user_id => "1", :familyname => "山田", :firstname => "太郎", :kana_familyname => "ヤマダ", :kana_firstname => "タロウ", :telephone_number => "090", :postal_code => "", :address => "東京都")

Cart.create(:user_id => "1", :cd_id => "1", :amount => "2")
