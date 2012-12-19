class HomeController < ApplicationController
  def index
     @user = params[:username]
     if current_user != nil
        redirect_to '/' + current_user.luser.name
     end
  end
  
  def show
    @user =  params[:username]
  end

end
