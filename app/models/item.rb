class Item < ApplicationRecord
  validates :images,             length: {minimum: 1, maximum: 5, message: "は１枚以上５枚以下にしてください"}
  validates :name,               presence: true, length:{ maximum: 40 }
  validates :text,               presence: true, length:{ maximum: 1000 }
  validates :category_id,        presence: true, numericality: {other_than: 1, message:"を選択してください"}
  validates :condition_id,       presence: true, numericality: {other_than: 1, message:"を選択してください"}
  validates :delivery_charge_id, presence: true, numericality: {other_than: 1, message:"を選択してください"}
  validates :prefecture_id,      presence: true, numericality: {other_than: 1, message:"を選択してください"}
  validates :delivery_day_id,    presence: true, numericality: {other_than: 1, message:"を選択してください"}
  validates :price,              presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  has_many_attached :images
  belongs_to :user
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :delivery_day
end
