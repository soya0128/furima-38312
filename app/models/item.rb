class Item < ApplicationRecord
  validates :image,              presence: true
  validates :name,               presence: true
  validates :text,               presence: true
  validates :category_id,        presence: true, numericality: {other_than: 1}
  validates :condition_id,       presence: true, numericality: {other_than: 1}
  validates :delivery_charge_id, presence: true, numericality: {other_than: 1}
  validates :prefecture_id,      presence: true, numericality: {other_than: 1}
  validates :delivery_day_id,    presence: true, numericality: {other_than: 1}
  validates :price,              presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :user_id,            presence: true

  
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :delivery_day
end
