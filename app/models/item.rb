class Item < ApplicationRecord
  validates :image,              null: false
  validates :name,               null: false
  validates :text,               null: false
  validates :category_id,        null: false
  validates :condition_id,       null: false
  validates :delivery_charge_id, null: false
  validates :prefecture_id,      null: false
  validates :delivery_day_id,    null: false
  validates :price,              null: false
  validates :user_id,            null: false, foreign_key: true
end
