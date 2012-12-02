class HomeController < ApplicationController
  def index
     @user = params[:username]
  end
  
  def show
    @user =  params[:username]
  end

end
