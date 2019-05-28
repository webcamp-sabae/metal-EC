class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          # :registerable,  登録関係の機能をオフ
          # :recoverable,
          :rememberable,
          :validatable
end
