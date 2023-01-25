class Order < ApplicationRecord
  belongs_to :item, optional: true

  belongs_to :user, optional: true

  attr_accessor :token

  has_one :address
end
