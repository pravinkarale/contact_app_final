class UserMessageMailer < ApplicationMailer
  def user_message(opts)
  	@contact_message = opts 
    mail(subject: "#{opts[:full_name]} sent you the message")
  end
end
