
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :othersaddresses
  has_many :receipts

  acts_as_paranoid

  # adminsコントローラーからのデータ登録、更新の場合はバリデーションをスキップする
  # ======================================================
  def admins_namespace?
    @class_name.include?('Admins') if @class_name
  end

  def namespace(class_name)
    @class_name = class_name
  end
  # ======================================================

  with_options unless: :admins_namespace? do
    before_validation :set_postal_code
    before_validation :set_address
    before_validation :set_telephone_number

    validates :postal_code, format: { with: /\A\d{7}\z/ }
    validates :first_postal_code, :last_postal_code, presence: true
    validates :statu_address, :city_address, presence: true
    validates :telephone_number, format: { with: /\A\d{11}\z/ }
    validates :telephone_number1,
    :telephone_number2,
    :telephone_number3,
    presence: true
  end

  # 仮想カラムをセット
  attr_accessor :first_postal_code, :last_postal_code
  attr_accessor :statu_address, :city_address, :street_address
  attr_accessor :telephone_number1, :telephone_number2, :telephone_number3

  # データ仮想カラム用にを工して取り出すためのメソッド
  def first_postal_code
    @first_postal_code || self.postal_code[0..2] if self.postal_code.present?
  end

  def last_postal_code
    @last_postal_code || self.postal_code[3..6] if self.postal_code.present?
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

  def telephone_number1
    @telephone_number1 || self.telephone_number[0..2] if self.telephone_number.present?
  end

  def telephone_number2
    @telephone_number2 || self.telephone_number[3..6] if self.telephone_number.present?
  end

  def telephone_number3
    @telephone_number3 || self.telephone_number[7..10] if self.telephone_number.present?
  end

  # 仮想カラムを本来のカラムの状態に変換するメソッド
  def set_postal_code
    self.postal_code = [@first_postal_code, @last_postal_code].join
  end

  def set_telephone_number
    self.telephone_number = [@telephone_number1, @telephone_number2, @telephone_number3].join
  end

  def set_address
      self.address = [
        @statu_address.gsub(/[ |　]/,''),
        ' ',
        @city_address.gsub(/[ |　]/,''),
        '　',
        @street_address.gsub(/[ |　]/,'')
      ].join
  end

  # ============== address ==============
  # data保存時にstatu, city, streetの結合部に区切り文字を追加する。
  # 仮想データの取り出しを用意にするため

  def split_address
    address_pattern = /(?<statu>.*)[ ](?<city>.*)[　](?<street>.*)/
    return address_pattern.match(self.address)
  end

end
