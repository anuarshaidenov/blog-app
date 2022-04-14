RSpec.describe 'Testing users views', type: :feature do
  describe 'user#index' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com', password: 'password', confirmed_at: Time.now)
      visit user_session_path
      fill_in "Email",	with: "to@example.com"
      fill_in "Password",	with: "password"
      click_on "Log in"  
    end

    it "I can see the username of all other users." do
      expect(page).to have_content 'Tom' 
    end

    it "I can see the profile picture for each user." do
      expect(page.find('img')['src']).to have_content 'photo.jpg'
    end

    it "I can see the number of posts each user has written." do
      expect(page).to have_content 'Number of posts: 0'
    end
    
    it "When I click on a user, I am redirected to that user's show page" do
      click_on 'Tom'
      expect(current_path).to eq user_path User.first.id
    end
  end
end