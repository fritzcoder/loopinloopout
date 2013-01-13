class LuserProjectsController < ApplicationController
  
  def index
    @luser_projects = LuserProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lusers }
    end
  end

  # GET /lusers/1
  # GET /lusers/1.json
  def show
    @luser_project = LuserProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @luser_project }
    end
  end

  # GET /lusers/new
  # GET /lusers/new.json
  def new
    @luser_project = LuserProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @luser_project }
    end
  end

  # GET /lusers/1/edit
  def edit
    @luser_project = LuserProject.find(params[:id])
  end

  # POST /lusers
  # POST /lusers.json
  def create
    @luser_project = LuserProject.new(params[:luser_project])
   
    respond_to do |format|
      if @luser_project.save
        format.html { redirect_to '/' + name, notice: 'Luser was successfully created.' }
        format.json { render json: @luser_project, status: :created, location: @luser }
      else
        format.html { render action: "new" }
        format.json { render json: @luser_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lusers/1
  # PUT /lusers/1.json
  def update
    @luser_project = LuserProject.find(params[:id])

    respond_to do |format|
      if @luser_project.update_attributes(params[:luser_project])
        format.html { redirect_to @luser_project, notice: 'Luser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @luser_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lusers/1
  # DELETE /lusers/1.json
  def destroy
    @luser_project = LuserProject.find(params[:id])
    @project = Project.find(:first, :conditions => {:id => @luser_project.project_id })
    @luser_project.destroy

    respond_to do |format|
      format.html { redirect_to project_url(current_user.luser.name, @project) }
      format.json { head :no_content }
    end
  end
end
