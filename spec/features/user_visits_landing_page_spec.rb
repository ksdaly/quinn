require 'spec_helper'

feature 'User cannot access landing page when signed in', %Q{
    As an athenticated user
    I donnot want to see the landing page
    So that I am not confused with the structure of the app
} do

  # ACCEPTANCE CRITERIA
  # * If I am not authenticated, I can visit the landing page
  # * If I am authenticated, I cannot visit the landing page and instead am redirected to user dashboard


  let!(:user) { create(:user) }

  scenario 'unauthenticated user visits root path' do
    visit root_path
    expect(current_path).to eql(root_path)
    expect(page).to have_content('Sign up for Quinn')
  end

  scenario 'authenticated user visits root path' do
    sign_in_as(user)
    visit root_path
    expect(current_path).to eql(authenticated_root_path)
    expect(page).to_not have_content('Sign up for Quinn')
  end

  scenario 'sign in and sign out causes no root path related errors' do
    visit root_path
    sign_in_as(user)
    visit root_path
    click_on 'Sign out'
    expect(current_path).to eql(root_path)
    expect(page).to have_content('Sign up for Quinn')
  end
end
