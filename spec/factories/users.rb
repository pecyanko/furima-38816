FactoryBot.define do
  factory :user do
    transient do
    end
    nick_name             { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    last_name             { '山田' }
    last_name_kana        { 'ヤマダ' }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
