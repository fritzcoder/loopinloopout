class HomeController < ApplicationController
  def index
     @user = params[:username]
  end

end
