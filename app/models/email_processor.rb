class EmailProcessor
  def self.process(email)
    Post.create!({ body: email.body, email: email.from, user: user(email) })
  end

  def self.user(email)
    User.where(email: email.from).first
  end
end
