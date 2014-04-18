require 'spec_helper'

describe User do

  it 'associates user with a post' do
    user = create(:user)
    email = build(:email, from: user.email)
    post = EmailProcessor.process(email)

    expect(post.body).to eql(email.raw_html)
    expect(post.email).to eql(email.from)
    expect(post.user).to eql(user)
  end

  it 'does not create a post if there is no associated user' do
    initial_count = Post.count
    email = build(:email)
    post = EmailProcessor.process(email)

    expect(Post.count).to eql(initial_count)
  end

end
