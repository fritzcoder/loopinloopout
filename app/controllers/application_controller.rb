class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_if_username
  
  def after_sign_in_path_for(resource)
   #redirect_to '/' + current_user.luser.name + '/banks'
    if current_user.luser != nil 
      banks_path(current_user.luser.name)
    else
      new_luser_url
    end
  end
  
  
  private 
  
  def check_if_username 
    if user_signed_in?
      luser = Luser.find(:first, :conditions => {:user_id => current_user.id})
      if luser == nil
        redirect_to new_luser_url
      end
    end
  end
  
end
