RSpec.describe 'Testing posts views', type: :feature do
  describe 'posts#index' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                                password: 'password', confirmed_at: Time.now)
      (1..5).each { |i| first_user.posts.create title: "Post number #{i}", text: "This is my #{i} post!" }
      Comment.create! author: first_user, post: Post.last, text: 'Hi, tom!'
      Like.create! author: first_user, post: Post.last
      visit user_session_path
      fill_in 'Email',	with: 'to@example.com'
      fill_in 'Password',	with: 'password'
      click_on 'Log in'
      visit user_posts_path user_id: first_user.id
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

    it "I can see a post's title." do
      expect(page).to have_content 'Post number 1'
    end

    it "I can see some of the post's body." do
      expect(page).to have_content 'This is my 1 post'
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content 'Comments:'
      expect(page).to have_content 'Hi, tom!'
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments: 1'
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content 'Likes: 1'
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'next page'
    end

    it "When I click on a post, it redirects me to that post's show page." do
      click_on 'Post number 1'
      expect(current_path).to eq user_post_path user_id: User.last.id, id: Post.first.id
    end
  end

  describe 'post#show views' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                                password: 'password', confirmed_at: Time.now)
      (1..5).each { |i| first_user.posts.create title: "Post number #{i}", text: "This is my #{i} post!" }
      Comment.create! author: first_user, post: Post.last, text: 'Hi, tom!'
      Like.create! author: first_user, post: Post.last
      visit user_session_path
      fill_in 'Email',	with: 'to@example.com'
      fill_in 'Password',	with: 'password'
      click_on 'Log in'
      visit user_post_path user_id: first_user.id, id: Post.last.id
    end

    it "I can see the post's title." do
      expect(page).to have_content 'Post number 5'
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content 'by Tom'
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content 'Comments (1):'
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content 'Likes: 1'
    end

    it 'I can see the post body.' do
      expect(page).to have_content 'This is my 5 post!'
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content 'Tom:'
    end
    it 'I can see the comment each commentor left' do
      expect(page).to have_content 'Hi, tom!'
    end
  end
end
