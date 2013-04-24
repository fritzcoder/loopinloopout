class ProjectsController < ApplicationController
  load_and_authorize_resource
  
  def prizes
    @project = Project.find(params[:id])
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => params[:username]})
  end
  
  def rules
    @project = Project.find(params[:id])
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => params[:username]})
  end
  
  def upload_file
    @sound_file = eval(params[:sound_file][:type]).new(params[:sound_file])
    @project = Project.find(params[:id])
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => params[:username]})
    
    @sound_file.created_by = current_user.luser.name
    
    respond_to do |format|
      if @sound_file.save
        #should be background process
         if @sound_file.audio != nil
              Runner.generate_waveform(@sound_file)
         end
          project_file = ProjectFile.new
          project_file.sound_file_id = @sound_file.id
          project_file.project_id = @project.id
          project_file.save
          
          if @sound_file.type == "SongRemix"
            @project.project_scores.each do |score|
              sound_file_score = SoundFileScore.new
              sound_file_score.project_id = @project.id
              sound_file_score.sound_file_id = @sound_file.id
              sound_file_score.project_score_id = score.id
              sound_file_score.save
            end
          end
          
          Activity.AddedFileToProject(current_user.luser, @project, @sound_file)
          
          format.html { redirect_to project_url(@user_name, @project), notice: 'Sound was successfully added.' }
          format.json { render json: @sound_file, status: :created}
      else
          format.html { render action: "new", notice: 'Error'  }
          format.json { render json: @sound_file.errors, status: :unprocessable_entity }
      end
    end  
  end
  
  # GET /projects
  # GET /projects.json
  def index
    @user = Luser.find(:first, :conditions => {:name => params[:username]})
    @luser_projects = LuserProject.find(:all, :conditions => { :luser_id => @user.id })
    @projects = @luser_projects.map { |l| l.project }
    @user_name = params[:username]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    s_files = ProjectFile.find(:all, :conditions => { :project_id => params[:id] })
    all_sound_files = s_files.map { |f| f.sound_file }
    @sound_files = all_sound_files.reject { |f| f.type != 'SoundFile' }
    @stem_files = all_sound_files.reject { |f| f.type != 'Stem' }
    @song_files = all_sound_files.reject { |f| f.type != 'Song' }
    @remix_files = all_sound_files.reject { |f| f.type != 'SongRemix' }
    @sound_file = SoundFile.new
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => @user_name})
    @members = LuserProject.find(:all, :conditions => {:project_id => params[:id]}).map { |m| m.luser}
    @total_score = @project.total_score
    
    if @project.scoring == true and @project.voting == true
      total_votes = @project.total_votes
      @remix_files.sort!{|a,b| b.score_with_votes(total_votes, 10) <=> a.score_with_votes(total_votes, 10) }
    elsif @project.scoring == true 
      @remix_files.sort!{|a,b| b.score <=> a.score }
    else
      @remix_files.sort!{|a,b| b.votes_count <=> a.votes_count }
    end
    
    @places = Hash.new
    p = 1
    @remix_files.each do |r|
      @places[r.id] = p
      p = p + 1
    end
    
    @user = Luser.find(:first, :conditions => {:name => params[:username]})
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @user_name = params[:username]
    @user = current_user.luser
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => @user_name})
    @project = Project.find(params[:id])
    @lusers = LuserProject.find(:all, :conditions => {:project_id => params[:id]}).map { |l| l.luser }
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.type = params[:type][:id]
    @project.access = "Private"
    @user_name = params[:username]
    
    @user = current_user.luser
    @project.created_by = @user.name
    role = Role.find(:first, :conditions => {:name => "Creator"} )

    respond_to do |format|
      if @project.save
        luser_project = LuserProject.new 
        luser_project.project_id = @project.id
        luser_project.luser_id = @user.id
        luser_project.role_id = role.id
        luser_project.save
        Activity.created_project(current_user.luser, @project)
        
        format.html { redirect_to project_url(@user_name, @project), notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created}
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @user_name = params[:username]
    genres = params[:genres].strip
    luser = Luser.find(:first, :conditions => {:name => params[:luser_name]} )
        
    respond_to do |format|
      if params[:commit] == "Add Luser"
        if luser != nil 
          luser_project = LuserProject.new 
          luser_project.project_id = @project.id
          luser_project.luser_id = luser.id
          luser_project.role_id = params[:luser][:role]
          luser_project.save
          
          format.html { redirect_to project_url(@user_name, @project), notice: 'Project was successfully updated.' }
          format.json { head :no_content }
        end 
      elsif @project.update_attributes(params[:project])
        Genre.add_project_genres(@project, genres)
        format.html { redirect_to project_url(@user_name, @project), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort_remix_list
      @project = Project.find(params[:id])
      sort_by = params[:sort_by]
      @user_name = params[:username]
      s_files = ProjectFile.find(:all, :conditions => { :project_id => params[:id] })
      all_sound_files = s_files.map { |f| f.sound_file }
      @remix_files = all_sound_files.reject { |f| f.type != 'SongRemix' }
      @total_score = @project.total_score
      
      if @project.scoring == true and @project.voting == true
        total_votes = @project.total_votes
        @remix_files.sort!{|a,b| b.score_with_votes(total_votes, 10) <=> a.score_with_votes(total_votes, 10) }
      elsif @project.scoring == true 
        @remix_files.sort!{|a,b| b.score <=> a.score }
      else
        @remix_files.sort!{|a,b| b.votes_count <=> a.votes_count }
      end

      @places = Hash.new
      p = 1
      @remix_files.each do |r|
        @places[r.id] = p
        p = p + 1
      end
      
      if sort_by == "recent"
        @remix_files.sort!{|a,b| b.created_at <=> a.created_at }
      elsif sort_by == "score"
        @remix_files.sort!{|a,b| b.score <=> a.score }
      elsif sort_by == "vote"
        @remix_files.sort!{|a,b| b.votes_count <=> a.votes_count }
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @user_name = params[:username]
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
