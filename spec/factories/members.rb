FactoryBot.define do
  factory :member, class: Member do
    email { Faker::Internet.email }
    password '11111111'
    password_confirmation '11111111'
  end
end
