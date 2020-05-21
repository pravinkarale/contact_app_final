class Api::ContactMessagesController < ApplicationController

  def create
    I18n.locale = contact_message_params[:locale].to_sym
    contact_message = ContactMessage.new(contact_message_params)
    if contact_message.save
      success_message = t("validation.success")
      render json: { result: "success", status: "success", message: success_message }
    else
      error_message = t("validation.error")
      render json: { result: "failure", status: "failure", message: error_message }
    end
  end

  def contact_message_params
    params.require(:contact_message).permit(:first_name, :last_name, :email, :phone, :message, :locale)
  end
end
