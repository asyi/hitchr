require 'ffaker'

FactoryGirl.define do
  factory :user do

    # sequence(:email) { |n| "person#{n}@example.com" } # we can use Faker gem here

    email {FFaker::Internet.email}

    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    gender { %w(male female).sample }
    date_of_birth { FFaker::Time.date }
    reliability {rand()}
    password { "123456" }
    password_confirmation { "123456" }
  end
end
