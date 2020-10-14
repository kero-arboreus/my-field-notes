FactoryBot.define do
  factory :article do
    title { Faker::String.random(length: 3..30) }
    category_id        { 2 }
    date               { '2020-01-01' }
    time_zone_id       { 2 }
    prefecture_id      { 14 }
    address            {'台東区上野公園9-83'}
    parking            {5}
    toilet             {5}
    crowd              {5}
    hashbody           {'#ねこ'}
    text               {Faker::Lorem.sentence}
    association :user

    after(:build) do |article|
      article.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
