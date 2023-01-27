class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :Prefecture
  belongs_to :user
  has_one :order

  has_one_attached :image

  validates :name, presence: true

  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :image, presence: true
  validates :cost, presence: true
  validates :cost, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  validates :cost,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'が設定範囲外です' }

  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :charge_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "を入力してください" }
end
