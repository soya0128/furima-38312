class Item < ApplicationRecord
  validates :image,              presence: true
  validates :name,               presence: true
  validates :text,               presence: true
  validates :category_id,        presence: true, numericality: {other_than: 1}
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :delivery_day_id,    presence: true
  validates :price,              presence: true
  validates :user_id,            presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :delivery_day
end
