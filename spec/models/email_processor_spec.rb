require 'spec_helper'

describe User do

  it 'associates user with a post' do
    user = create(:user)
    email = build(:email, from: user.email)
    post = EmailProcessor.process(email)

    expect(post.body).to eql(email.body)
    expect(post.email).to eql(email.from)
    expect(post.user).to eql(user)
  end

end
