FactoryGirl.define do
  factory :user do
    sequence (:email) { |n| "kate#{n}@example.com" }
    password '12345678'
  end

  factory :email, class: OpenStruct do
    # Assumes Griddler.configure.to is :hash (default)
    to [{ full: 'to_user@email.com', email: 'to_user@email.com', token: 'to_user', host: 'email.com', name: nil }]
    from 'user@email.com'
    subject 'email subject'
    body 'Hello!'
    raw_html '<div dir=\"ltr\">This is the first line,<div>this is a new line.</div><div>Regards,</div><div>Kate</div></div>\n\n'
    attachments {[]}

  #   trait :with_attachment do
  #     attachments {[
  #       ActionDispatch::Http::UploadedFile.new({
  #         filename: 'img.png',
  #         type: 'image/png',
  #         tempfile: File.new("#{File.expand_path File.dirname(__FILE__)}/fixtures/img.png")
  #       })
  #     ]}
  #   end
  end

  factory :post do
    sequence (:body) { |n| "hello from Mandrill #{n}"}
    sequence(:email) { |n| "kate#{n}@example.com" }
    user
  end
end
