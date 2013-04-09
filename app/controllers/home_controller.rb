class HomeController < ApplicationController
  def index
     @user_name = params[:username]
     if current_user != nil
        redirect_to '/' + current_user.luser.name
     end
  end
  
  def favourites
    @user_name = current_user.luser.name
    @user = current_user.luser
    bookmarked = BankBookmark.find(:all, :conditions => {:luser_id => @user.id })
    sound_bookmarked = SoundFileBookmark.find(:all, :conditions => {:luser_id => @user.id})
    @sound_bookmarks = sound_bookmarked.map { |s| s.sound_file }
    @bank_bookmarks = bookmarked.map { |b| b.bank }
    subscriptions = Subscription.find(:all, :conditions => {:luser_id => @user.id})
    @projects = subscriptions.map { |p| p.project }
  end
  
  def search
    sql = "name LIKE ?"
    
    if params[:q] != nil and params[:q] != ""
      if params[:type] == "bank"
         @results = Bank.paginate(:page => params[:page], :per_page => 5, 
          :conditions => [sql,"%#{params[:q]}%"])
      else
          @results = Project.paginate(:page => params[:page], :per_page => 5, 
          :conditions => [sql,"%#{params[:q]}%"])
      end
    end
    
    respond_to do |format|
      format.html 
      format.json { render json: @projects }
    end
  end
  
  def explore
    @latest_projects = Project.find(:all, :limit => 10, :order => 'created_at desc')
    @latest_banks = Bank.find(:all, :limit => 10, :order => 'created_at desc')
    @popular_banks = Bank.find(:all, :limit => 10, :order => 'bank_bookmarks_count desc')
    @genres = Genre.find(:all)
    Project.find(:all, :group => "type").count
    
    @types = Project.find(
        :all, 
        :select => 'count(*) count, type', 
        :group => 'type', 
        :order => 'count DESC',
        :limit => 5)
    
    #Create a genre cache table that will collect all the different genres
    #@genres = Project.select(:genre).uniq
    #@project_types =  [["Personal", "Project"],["Collaboration", "Collaboration"], ["Remix","Remix"], 
  	#			["Remix Challenge", "RemixChallenge"], ["Challenge", "Challenge"]]
  				
  	
    respond_to do |format|
      format.html 
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
