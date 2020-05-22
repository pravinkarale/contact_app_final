class Api::UsersController < ApplicationController

  def create
    I18n.locale = user_params[:locale].to_sym
    user = User.new(user_params)
    if user.save
      success_message = t("validation.success")
      render json: { result: "success", status: "success", message: success_message }
    else
      error_message = t("validation.error")
      render json: { result: "failure", status: "failure", message: error_message }
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :message, :locale)
  end
end
