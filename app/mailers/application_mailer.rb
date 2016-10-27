class ApplicationMailer < ActionMailer::Base
  default from: "no_reply@corticalmetrics.com"
  layout 'mailer'
end
