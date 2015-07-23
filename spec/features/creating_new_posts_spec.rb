require 'rails_helper.rb'

describe 'Creating posts' do
  it 'can create a job' do
    user = FactoryGirl.create(:user, :email => "mmm@mmm.pt", :password => "12345678")
    visit '/'
    click_link 'Login'
    fill_in "Email", :with => "mmm@mmm.pt"
    fill_in "Password", :with => "12345678"
    click_button "Log in"
    expect(page).to have_content("mmm")
    click_link 'new post'
    attach_file("Image", "spec/files/images/teste.jpg")
    fill_in 'Caption', with: "nom nom nom #coffeetime"
    click_button 'Submit picture'
    expect(page).to have_css("img[src*='teste']")
    click_link("mmm", :match => :first)
    expect(page).to have_content("1 Publications")
  end
end
