class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.order('created_at desc').find(:all, 
    :conditions => {:project_id => params[:project_id], :parent_id => nil})
    @discussion = Discussion.new
    @project = Project.find(params[:project_id])
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => @user_name })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussion = Discussion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(params[:discussion])
    @discussion.project_id
    @project = Project.find(params[:project_id])
    @discussion.project_id = @project.id
    @discussion.luser_id = current_user.luser.id
    @user_name = params[:username]
    
    if @discussion.comment.start_with?("#")
      parent = Discussion.find(:first, :conditions => {:number => @discussion.comment[/\#(.*?):/, 1], 
        :project_id => @discussion.project_id})
      @discussion.parent_id = parent.id
    end

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to project_discussions_path(@project.created_by, @project), 
          notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end
end
