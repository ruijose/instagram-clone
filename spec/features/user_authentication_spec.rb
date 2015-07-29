require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).to_not have_content("Logout")
    click_link 'Login'
    fill_in 'Email', with: "teste@teste.com"
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
    expect(page).to have_content("teste")
    click_link 'teste'
    expect(page).to have_content("logout")
    expect(page).to have_content("edit")
    expect(page).to have_content("teste")
    expect(page).to have_content("teste@teste.com")
    expect(page).to have_css("img[src*='teste']")
  end

  scenario 'user can logout once logged in' do
    visit '/'
    expect(page).to_not have_content("Logout")
    click_link 'Login'
    fill_in 'Email', with: "teste@teste.com"
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
    expect(page).to have_content("teste")
    click_link "teste"
    click_link "logout"
    expect(page).to have_content("Login")
    expect(page).to have_content("Sign up")
  end
end
