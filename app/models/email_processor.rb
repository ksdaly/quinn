class EmailProcessor
  def self.process(email)
    user = user(email)
    Post.create!(arguments(email, user)) if user.present?
  end

  def self.arguments(email, user)
    {
      body: email.raw_html,
      email: email.from,
      user: user
    }
  end

  def self.user(email)
    User.where(email: email.from).first
  end
end
