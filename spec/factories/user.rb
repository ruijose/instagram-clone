FactoryGirl.define do
  factory :user do
    email "teste@teste.com"
    password "12345678"
    password_confirmation "12345678"
    avatar { File.new(Rails.root.join("spec", "files", "images", "teste.jpg")) } 
  end
end
