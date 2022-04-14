require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com', password: 'password')
    visit user_session_path
  end

  it "I can see the username and password inputs and the Submit button." do
    expect(page).to have_field(type: 'email')
    expect(page).to have_field(type: 'password')
    expect(page).to have_button(type: 'submit')
  end

  it "When I click the submit button without filling in the username and the password, I get a detailed error." do
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email'
  end

end