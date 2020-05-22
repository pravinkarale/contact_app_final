class UserMessageMailer < ApplicationMailer
  def user_message(opts)
  	@contact_message = opts 
    mail(subject: "#{@contact_message.full_name} sent you the message")
  end
end
