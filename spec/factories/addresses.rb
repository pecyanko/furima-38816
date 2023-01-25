FactoryBot.define do
  factory :address do
    transient do
    end

    postal_code       { Faker::Address.postcode }
    prefecture_id     { 2 }
    city              { Faker::Address.city}
    block             { 1111 }
    building          { 1111 }
    phone_number      { Faker::PhoneNumber.numerify }
    
  end
end


