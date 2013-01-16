class HomeController < ApplicationController
  def index
     @user_name = params[:username]
     if current_user != nil
        redirect_to '/' + current_user.luser.name
     end
  end
  
  def show
    @user_name =  params[:username]
  end

end
