require 'spec_helper'

feature 'user creates company',%Q{
  As a job seeker
  I want to create a company profile
  So that I can track my interaction with it
} do

  # ACCEPTANCE CRITERIA
  # * I must be signed in to create a company profile
  # * I must specify valid information by filing out a form: display name
  # * If I specify required information a company profile is created


  before(:all) do
    @user = create(:user)
    sign_in_as(@user)
  end

  scenario 'user creates company profile' do
    initial_company_count = Company.count
    visit new_company_path
    fill_in 'Display Name', with: 'Umbrella Corporation'
    click_button 'Submit'
    expect(page).to have_content('Umbrella Corporation')
    expect(Company.count).to eql(initial_company_count + 1)
  end
end
