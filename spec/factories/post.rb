require 'faker'

FactoryGirl.define do
  factory :post do
    caption Faker::Lorem.word
    image { File.open(File.join(Rails.root, 'spec/files/images/teste.jpg')) }
  end
end
