FactoryBot.define do
  factory :raw_product, class: RawProduct do
    name { Faker::Ancient.god }
    desc { Faker::Hipster.paragraph(5, false, 10) }
    cost 1.0
    image '/fake/path/to/image'
  end
end
