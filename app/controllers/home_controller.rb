class HomeController < ApplicationController
  def index
     @user_name = params[:username]
     if current_user != nil
        redirect_to '/' + current_user.luser.name
     end
  end
  
  def show
    @user_name =  params[:username]
    @user = Luser.find(:first, :conditions => { :name => @user_name })
    @luser = @user
    @following = @user.luser_follows.limit(20).map { |u| u.following_luser }
    @followers = @user.following_lusers.limit(20).map { |u| u.luser }
  end

end
