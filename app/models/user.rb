class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}, on: :create
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_furigana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_furigana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthdate, presence: true

  has_many :items
  has_many :orders
  has_many :cards, dependent: :destroy
end
