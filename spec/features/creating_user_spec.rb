require 'rails_helper'

describe "creating a user" do
  it "displays the user's username after successful login" do
    user = FactoryGirl.create(:user, :email => "mmm@mmm.pt", :password => "12345678")
    visit '/'
    click_link 'Login'
    fill_in "Email", :with => "mmm@mmm.pt"
    fill_in "Password", :with => "12345678"
    click_button "Log in"
    expect(page).to have_content("mmm")
    click_link "mmm"
    expect(page).to have_content("logout")
    expect(page).to have_content("edit")
    expect(page).to have_content("mmm")
    expect(page).to have_content("mmm@mmm.pt")
    expect(page).to have_css("img[src*='teste']")
  end
end
