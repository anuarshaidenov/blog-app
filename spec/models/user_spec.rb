require 'rails_helper'

RSpec.describe User, type: :model do
  # create a new user
  before(:each) do
    @user = User.new(name: 'Test User', bio: 'Test Bio', photo: 'Test Photo')
  end

  # test if user is not valid without a name
  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it 'PostsCounter must be an integer greater than or equal to zero.' do
    @user.posts_counter = nil
    expect(@user).to_not be_valid
  end
  it 'check if the posts_counter greater than or equal to zero' do
    expect(subject.posts_counter).to be >= 0
  end
end
