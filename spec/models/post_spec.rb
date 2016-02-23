require 'rails_helper'

describe Post do
  let(:lisa)  { create(:user, email: "lisa@simpsons.com") }
  let(:bart)  { create(:user, email: "bart@simpsons.com") }
  let(:magie) { create(:user, email: "magie@simpsons.com") }
  let(:post)  { create(:post) }

  describe 'post creation validation' do
    it 'has a valid factory' do
      expect(lisa).to be_valid
      expect(post).to be_valid
    end

    it 'is invalid without an image' do
      expect(build(:post, image: nil)).to_not be_valid
    end

    it 'is invalid without a caption' do
      expect(build(:post, caption: nil)).to_not be_valid
    end
  end

  describe "#followed_users_posts" do
    before :each do
      first_post   = create(:post, user_id: lisa.id)
      second_post  = create(:post, user_id: magie.id)
      third_post   = create(:post, user_id: magie.id)
      bart.follow!(magie)
      magie.follow!(lisa)
    end

    it "returns 2 posts, bart only follows magie" do
      expect(Post.followed_users_posts(bart).size).to eq(2)
    end

    it "returns 1 posts, magie follows lisa" do
      expect(Post.followed_users_posts(magie).size).to eq(1)
    end

    it "returns 0 posts, lisa follow noone" do
      expect(Post.followed_users_posts(lisa).size).to eq(0)
    end
  end
end
