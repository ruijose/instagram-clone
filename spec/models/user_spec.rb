require 'rails_helper'

describe User do
  before :each do
    @lisa = create(:user, email: "lisa@simpsons.com")
    @bart = create(:user, email: "bart@simpsons.com")
    @post = create(:post)
  end

  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  it 'is invalid without an email' do
    expect(build(:user, email: nil)).not_to be_valid
  end

  it 'is invalid if passwords does not match' do
    expect(build(:user, password: "asdasd", password_confirmation: "12123")).not_to be_valid
  end

  it 'returns a username' do
    expect(@lisa.username).to eq("lisa")
  end

  it 'allows a user to like a post' do
    @bart.like(@post)
    expect(@bart.liked_pics.count).to eq(1)
  end

  it 'allows a user to follow and unfollow another users' do
    @bart.follow!(@lisa)
    expect(@bart.following?(@lisa)).to eq(true)
    expect(@bart.followed_users.count).to eq(1)
    @bart.unfollow!(@lisa)
    expect(@bart.following?(@lisa)).to eq(false)
    expect(@bart.followed_users.count).to eq(0)
  end
end
