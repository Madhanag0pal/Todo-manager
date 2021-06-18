class ApplicationMailer < ActionMailer::Base
  default from: "Todo Manager <noreplay@todo_manager.com>"
  layout "mailer"
end
