class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :othersaddresses
  has_many :receipts
end

# Othersaddress.new(user_id: 1, familyname: '目立留',firstname: 'の母',kana_familyname: 'メタル',kana_firstname: 'ハハ', telephone_number: '09012345678', postal_code: '5300001',address: '大阪府大阪市北区梅田1-1-1')
