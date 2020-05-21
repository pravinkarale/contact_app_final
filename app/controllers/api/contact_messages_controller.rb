class Api::ContactMessagesController < ApplicationController

  def create
    contact_message = ContactMessage.new(contact_message_params)
    if contact_message.save
      success_message = 'Message sent successfully'
      render json: { result: "success", status: "success", message: success_message }
    else
      error_message = 'Please fill up all mandatory fields with valid format'
      render json: { result: "failure", status: "failure", message: error_message }
    end
  end

  def contact_message_params
    params.require(:contact_message).permit(:first_name, :last_name, :email, :phone, :message)
  end
end
