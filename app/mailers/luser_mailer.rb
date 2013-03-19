class LuserMailer < ActionMailer::Base
  default from: "no-reply@loopinloopout.com"
  
  def new_follower(user, following_luser)
    @user = user
    @following_luser = following_luser
    
    mail(:to => user.email, :subject => "#{following_luser.name} started to follow you!")
  end
  
  def new_subscriber(user, project)
    @user = user
    @project = project
    
    owner = User.find(Luser.find(:first, :conditions => {:name => project.created_by}).user_id)
    mail(:to => owner.email, :subject => "#{user.name} subscribed to project #{project.name}!")
  end
end
