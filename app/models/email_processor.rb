class EmailProcessor
  def self.process(email)
    user = user(email)
    Post.create!({ body: email.body, email: email.from, user: user }) if user.present?
  end

  def self.user(email)
    User.where(email: email.from).first
  end
end
