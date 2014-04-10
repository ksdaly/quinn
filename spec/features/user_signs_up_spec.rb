require 'spec_helper'

feature 'User signs up', %Q{
  As a job seeker
  I want to sign up
  So that I can manage all aspects of my job application process
} do

  # ACCEPTANCE CRITERIA
  # * I must specify a valid username
  # * I must specify a valid email address
  # * If I don't provide the above, I get an error message
  # * If I specify valid information, I register my account
  # * After signing up, user is redirected to a new health profile;

  scenario 'with valid infomration' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'kate@example.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully')
    expect(page).to_not have_content('Sign up')
    expect(User.count).to eql(1)
  end

  scenario 'with missing information' do
    visit new_user_registration_path
    click_on 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'with a conflicting password confirmation' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'kate@example.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '87654321'
    click_button 'Sign up'
    expect(page).to have_content("doesn't match")
  end

end
