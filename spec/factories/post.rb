FactoryGirl.define do
  factory :post do
    caption "noFilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/teste.jpg', 'image/jpg')
  end
end
