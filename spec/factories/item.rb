FactoryBot.define do
  factory :item do
    transient do
    end
    name             {Faker::Name.initials }
    introduction     {Faker::Lorem.sentence}
    category_id      {2}
    condition_id     {2}
    charge_id        {2}
    prefecture_id    {2}
    delivery_day_id  {2}
    cost             {Faker::Number.between(from: 300, to: 9999999)}
    user_id { FactoryBot.create(:user).id }
   
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
