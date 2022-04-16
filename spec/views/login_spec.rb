require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                 password: 'password', confirmed_at: Time.now)
    visit user_session_path
  end

  it 'I can see the username and password inputs and the Submit button.' do
    expect(page).to have_field(type: 'email')
    expect(page).to have_field(type: 'password')
    expect(page).to have_button(type: 'submit')
  end

  it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'When I submit incorrect data get a detailed error.' do
    fill_in 'Email',	with: 'ttt@exaple.com'
    fill_in 'Password',	with: 'sometext'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'When I click the submit button I am redirected to the root page.' do
    fill_in 'Email',	with: 'to@example.com'
    fill_in 'Password',	with: 'password'
    click_on 'Log in'
    expect(current_path).to eq root_path
  end
end
