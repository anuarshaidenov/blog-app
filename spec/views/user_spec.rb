RSpec.describe 'Testing users views', type: :feature do
  describe 'user#index views' do
    before(:each) do
      User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                   password: 'password', confirmed_at: Time.now)
      visit user_session_path
      fill_in 'Email',	with: 'to@example.com'
      fill_in 'Password',	with: 'password'
      click_on 'Log in'
    end

    it 'I can see the username of all other users.' do
      expect(page).to have_content 'Tom'
    end

    it 'I can see the profile picture for each user.' do
      expect(page.find('img')['src']).to have_content 'photo.jpg'
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 0'
    end

    it "When I click on a user, I am redirected to that user's show page" do
      click_on 'Tom'
      expect(current_path).to eq user_path User.first.id
    end
  end

  describe 'users#show views' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                                password: 'password', confirmed_at: Time.now)
      (1..5).each { |i| first_user.posts.create title: "Post number #{i}", text: "This is my #{i} post!" }
      visit user_session_path
      fill_in 'Email',	with: 'to@example.com'
      fill_in 'Password',	with: 'password'
      click_on 'Log in'
      visit user_path first_user.id
    end

    it "I can see the user's profile picture." do
      expect(page.find('img')['src']).to have_content 'photo.jpg'
    end

    it "I can see the user's username." do
      expect(page).to have_content 'Tom'
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 5'
    end

    it "I can see the user's bio." do
      expect(page).to have_content 'Teacher from Mexico'
    end

    it "I can see the user's first 3 posts." do
      expect(page).to have_content 'Post number 5'
      expect(page).to have_content 'Post number 4'
      expect(page).to have_content 'Post number 3'
      expect(page).to have_no_content 'Post number 2'
    end

    it "I can see a button that lets me view all of a user's posts." do
      expect(page.find('a', text: 'See all')).to have_content 'See all'
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      click_on 'Post number 5'
      expect(current_path).to eq user_post_path user_id: Post.last.author.id, id: Post.last.id
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_on 'See all'
      expect(current_path).to eq user_posts_path user_id: User.last.id
    end
  end
end
