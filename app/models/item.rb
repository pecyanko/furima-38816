class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture
  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :image, presence: true
  validates :cost, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :cost,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  

  validates :prefecture_id, numericality: { other_than: 1 } 


end
