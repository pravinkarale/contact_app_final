class ContactMessagesController < ApplicationController
  
  def new
    @contact_message = ContactMessage.new
    respond_to do |format|
    	format.js
      format.html
    end
  end
end
