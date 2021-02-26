require 'faker'
FactoryBot.define do
  factory :user do 
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { 'qwertyuio' }
    password_confirmation { 'qwertyuio' }

    after(:create) do |user, _evaluator|
      user.places.create(
        name: Faker::Address::city,
        lat: Faker::Address::latitude,
        lon: Faker::Address::longitude,
        public_status: true
      )
      user.places.create(
        name: Faker::Address::city,
        lat: Faker::Address::latitude,
        lon: Faker::Address::longitude,
        public_status: false
      )
    end
  end
end