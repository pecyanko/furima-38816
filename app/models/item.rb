class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture
  belongs_to :user

  validates :title, :text, presence: true

  validates :prefecture_id, numericality: { other_than: 1 } 

end
