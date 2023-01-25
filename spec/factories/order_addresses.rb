FactoryBot.define do
  factory :order_address do
    transient do
    end

    postal_code       { '123-4567' }
    prefecture_id     { 2 }
    city              { Faker::Address.city}
    block             { 1111 }
    building          { 1111 }
    phone_number      { '09012345678' }
    user_id           { 1 }
    item_id           { 1 }
    token             {"tok_abcdefghijk00000000000000000"}
    
  end
end
