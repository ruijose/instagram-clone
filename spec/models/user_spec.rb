require 'rails_helper'

describe User do
  let(:lisa) { create(:user, email: "lisa@simpsons.com") }
  let(:bart) { create(:user, email: "bart@simpsons.com") }
  let(:post) { create(:post) }

  describe 'user attributed validations' do
    it 'has a valid factory' do
      expect(create(:user, email: "magie@simpsons.com")).to be_valid
    end

    it 'is invalid without an email' do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it 'is invalid without a password' do
      expect(build(:user, password: nil)).to_not be_valid
    end

    it 'is invalid with a wrong email format' do
      expect(build(:user, email: "jj.pt")).to_not be_valid
    end

    it 'is invalid with duplicate email address' do
      lisa_one = lisa
      lisa_two = build(:user, email: "lisa@simpsons.com")
      expect(lisa_two).to_not be_valid
    end
  end

  describe '#username' do
    it 'returns a username' do
      expect(lisa.username).to eq("lisa")
    end

    it 'returns a username' do
      expect(bart.username).to eq("bart")
    end
  end

  describe '#like' do
    it 'allows a user to like a post' do
      bart.like(post)
      expect(bart.liked_pics.count).to eq(1)
    end

    it 'raises an error' do
      expect { bart.like(nil) }.to raise_error(NoMethodError)
    end
  end

  describe '#follow' do
    it 'allows a user to follow another users' do
      bart.follow!(lisa)
      expect(bart.following?(lisa)).to eq(true)
      expect(bart.followed_users.count).to eq(1)
    end

    it 'raises an error' do
      expect { bart.follow!(nil) }.to raise_error(NoMethodError)
    end
  end

  describe '#unfollow' do
    it 'allow a user to unfollow another users' do
      bart.follow!(lisa)
      bart.unfollow!(lisa)
      expect(bart.following?(lisa)).to eq(false)
      expect(bart.followed_users.count).to eq(0)
    end

    it 'raises an error' do
      expect { bart.unfollow!(nil) }.to raise_error(NoMethodError)
    end
  end
end
