require 'rails_helper.rb'

feature 'create post' do
  background do
    @user = create(:user)
    @post = create(:post)
  end

  scenario 'can create a post from index page' do
    visit '/'
    expect(page).to have_content("New account")
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content("new post")
    expect(page).to have_content(@user.username)
    click_link 'new post'
    attach_file("Image", File.join(Rails.root, 'spec/files/images/teste.jpg'))
    fill_in 'Caption', with: @post.caption
    click_button 'Submit picture'
    expect(page).to have_content(@post.caption)
    expect(page).to have_css("img[src*='teste']")
    click_link(@user.username, :match => :first)
    expect(page).to have_content("1 Publications")
  end
end
