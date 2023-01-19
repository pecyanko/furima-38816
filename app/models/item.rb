class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture
  belongs_to :user
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
  validates :cost, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :cost,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank"}



end
