FactoryGirl.define do
  factory :post do
    caption "noFilter"
    image { File.open(File.join(Rails.root, 'spec/files/images/teste.jpg')) } 
  end
end
