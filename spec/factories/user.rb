require 'faker'

FactoryGirl.define do
  factory :user do
    fake_pass = Faker::Internet.password(10, 20)
    email Faker::Internet.email
    password fake_pass
    password_confirmation fake_pass
    avatar { File.new(Rails.root.join("spec", "files", "images", "teste.jpg")) }
  end
end
