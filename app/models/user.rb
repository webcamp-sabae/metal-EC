
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :othersaddresses
  has_many :receipts
   # 郵便番号の仮想カラム
   attr_accessor :first_postal_code, :last_postal_code

  validates :postal_code, format: { with: /\A\d{7}\z/ }, unless: :admins_namespace?
  validates :first_postal_code, :last_postal_code, presence: true,
   unless: :admins_namespace?

# adminsコントローラーからのデータ登録、更新の場合はバリデーションをスキップする
# ======================================================

  def admins_namespace?
    @class_name.include?('Admins') if @class_name
  end

  def namespace(class_name)
    @class_name = class_name
  end

# ============== postal_code ==============


  #先にset_postal_codeを呼ばないとバリデーションエラーになる
  before_validation :set_postal_code, unless: :admins_namespace?

  def first_postal_code
    @first_postal_code || self.postal_code[0..2] if self.postal_code.present?
  end

  def last_postal_code
    @last_postal_code || self.postal_code[3..6] if self.postal_code.present?
  end

  #DBカラムはpostal_codeのため、バリデーション前に結合して設定する
  def set_postal_code
    self.postal_code = [@first_postal_code, @last_postal_code].join
  end


  # ============== address ==============
  # /(?<status>.*[都|道|府|県])(?<address>.*)[ ](?<building>.*)/
  # data保存時に住所とマンション名で半角スペースを入れる
  # マンション名の半角スペースは削除して保存する

  # 住所の仮想カラム
  attr_accessor :statu_address, :city_address, :street_address

  validates :statu_address, :city_address, presence: true,
  unless: :admins_namespace?

  before_validation :set_address, unless: :admins_namespace?


  def split_address
    address_pattern = /(?<statu>.*)[ ](?<city>.*)[　](?<street>.*)/
    return address_pattern.match(self.address)
  end

  def statu_address
  	@statu_address || self.split_address[:statu] if self.address.present?
  end

  def city_address
  	@city_address || self.split_address[:city] if self.address.present?
  end

  def street_address
  	@street_address || self.split_address[:street] if self.address.present?
  end

  def set_address
  	self.address = [
      @statu_address.gsub(/[ |　]/,''),
      ' ',
      @city_address.gsub(/[ |　]/,''),
      '　',
      @street_address.gsub(/[ |　]/,'')].join
  end

  # ============== telephone_number ==============

  # 電話番号の仮想カラム
  attr_accessor :telephone_number1, :telephone_number2, :telephone_number3

  validates :telephone_number, format: { with: /\A\d{11}\z/ },
  unless: :admins_namespace?
  validates :telephone_number1, :telephone_number2, :telephone_number3, presence: true, unless: :admins_namespace?

  #
  before_validation :set_telephone_number, unless: :admins_namespace?

  def telephone_number1
  	@telephone_number1 || self.telephone_number[0..2] if self.telephone_number.present?
  end

  def telephone_number2
  	@telephone_number2 || self.telephone_number[3..6] if self.telephone_number.present?
  end

  def telephone_number3
  	@telephone_number3 || self.telephone_number[7..10] if self.telephone_number.present?
  end

  #
  def set_telephone_number
  	self.telephone_number = [@telephone_number1, @telephone_number2, @telephone_number3].join
  end
end
