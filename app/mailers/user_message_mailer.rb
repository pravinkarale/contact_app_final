class UserMessageMailer < ApplicationMailer
  def user_message(opts)
  	@user = opts
    mail(subject: "#{@user.full_name} sent you the message")
  end
end
