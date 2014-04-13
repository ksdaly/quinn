require 'spec_helper'

feature 'user signs out',%Q{
  As an authenticated user
  I want to sign out
  So that my profile remains secure
} do

  # ACCEPTANCE CRITERIA
  # * I have to be signed in
  # * I am signed out of my profile if I click on sign out button
  # * If I am signed out, I have the option of signing in

  scenario 'user signs out' do
    user = create(:user)
    sign_in_as(user)
    click_on 'Sign out'
    expect(page).to have_content('Sign in')
  end

end
