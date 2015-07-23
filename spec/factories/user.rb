FactoryGirl.define do
  factory :user do
    email "teste@teste.com"
    password "12345678"
    password_confirmation "12345678"
    avatar Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/teste.jpg', 'image/jpg')
  end
end
