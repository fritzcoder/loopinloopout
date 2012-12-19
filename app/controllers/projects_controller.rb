class ProjectsController < ApplicationController
  def upload_file
    @sound_file = SoundFile.new(params[:sound_file])
    @project = Project.find(params[:id])
    @user = params[:username]
    
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
          format.html { redirect_to project_url(@user, @project), notice: 'Sound was successfully added.' }
          format.json { render json: @sound_file, status: :created}
      else
          format.html { render action: "new" }
          format.json { render json: @sound_file.errors, status: :unprocessable_entity }
      end
    end  
  end
  
  # GET /projects
  # GET /projects.json
  def index
    luser = Luser.find(:first, :conditions => {:name => params[:username]})
    @luser_projects = LuserProject.find(:all, :conditions => { :luser_id => luser.id })
    @projects = @luser_projects.map { |l| l.project }
    @user = params[:username]

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
    @sound_file = SoundFile.new
    @user = params[:username]
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @user = params[:username]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.type = params[:type][:id]
    @project.access = "Private"
    @user = params[:username]
    luser = current_user.luser

    respond_to do |format|
      if @project.save
        luser_project = LuserProject.new 
        luser_project.project_id = @project.id
        luser_project.luser_id = luser.id
        luser_project.save
        
        format.html { redirect_to project_url(@user, @project), notice: 'Project was successfully created.' }
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
    @user = params[:username]

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @user = params[:username]
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
