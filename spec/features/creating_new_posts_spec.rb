require 'rails_helper.rb'

feature 'create post' do
  background do
    user = create(:user)
  end

  scenario 'can create a post from index page' do
    visit '/'
    expect(page).to_not have_content("Logout")
    click_link 'Login'
    fill_in 'Email', with: "teste@teste.com"
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
    expect(page).to have_content("teste")
    click_link 'new post'
    post = FactoryGirl.create(:post)
    attach_file("Image", File.join(Rails.root, 'spec/files/images/teste.jpg'))
    fill_in 'Caption', with: post.caption 
    click_button 'Submit picture'
    expect(page).to have_content(post.caption)
    expect(page).to have_css("img[src*='teste']")
    click_link("teste", :match => :first)
    expect(page).to have_content("1 Publications")
  end
end
