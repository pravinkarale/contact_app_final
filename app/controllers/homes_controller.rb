class HomesController < ApplicationController
  def index
  	@user = User.new
    respond_to do |format|
    	format.js
      format.html
    end
  end
end
