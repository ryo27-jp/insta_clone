class ApplicationMailer < ActionMailer::Base
  # 送信元のアドレス
  default from: 'instaclone@example.com'
  layout 'mailer'
end
