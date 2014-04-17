require 'spec_helper'

feature 'user views emails', %Q{
  As a job seeker
  I want to be the only one able to access posts related to my applications
  So that my information is secure
} do

# ACCEPTANCE CRITERIA
# * Only the user that sent the email can view or edit posts associated with it

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let!(:post) { create(:post, user: user1) }

  scenario 'unauthenticated user is unable to view posts' do
    visit posts_path
    expect(page).to have_content("You need to sign in or sign up before continuing")
  end

  scenario 'authorized user is able to view posts' do
    sign_in_as(user1)
    visit posts_path
    expect(page).to have_content(post.body)
  end

  scenario 'unauthorized user is not able to view posts' do
    sign_in_as(user2)
    visit posts_path
    expect(page).to_not have_content(post.body)
  end

end
