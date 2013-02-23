class SoundFileScoresController < ApplicationController
  # GET /sound_file_scores
  # GET /sound_file_scores.json
  def index
    @sound_file_scores = SoundFileScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sound_file_scores }
    end
  end

  # GET /sound_file_scores/1
  # GET /sound_file_scores/1.json
  def show
    @sound_file_scores = SoundFileScore.find(:all, :conditions => { :sound_file_id => params[:id] })
    @project = Project.find(params[:project_id])
    @song = SoundFile.find(params[:id])
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => @user_name })
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound_file_score }
    end
  end

  # GET /sound_file_scores/new
  # GET /sound_file_scores/new.json
  def new
    @sound_file_score = SoundFileScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound_file_score }
    end
  end

  # GET /sound_file_scores/1/edit
  def edit
    @sound_file_score = SoundFileScore.find(params[:id])
  end

  # POST /sound_file_scores
  # POST /sound_file_scores.json
  def create
    @sound_file_score = SoundFileScore.new(params[:sound_file_score])

    respond_to do |format|
      if @sound_file_score.save
        format.html { redirect_to @sound_file_score, notice: 'Sound file score was successfully created.' }
        format.json { render json: @sound_file_score, status: :created, location: @sound_file_score }
      else
        format.html { render action: "new" }
        format.json { render json: @sound_file_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sound_file_scores/1
  # PUT /sound_file_scores/1.json
  def update
    @sound_file_score = SoundFileScore.find(params[:id])

    respond_to do |format|
      if @sound_file_score.update_attributes(params[:sound_file_score])
        format.html { redirect_to @sound_file_score, notice: 'Sound file score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound_file_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_file_scores/1
  # DELETE /sound_file_scores/1.json
  def destroy
    @sound_file_score = SoundFileScore.find(params[:id])
    @sound_file_score.destroy

    respond_to do |format|
      format.html { redirect_to sound_file_scores_url }
      format.json { head :no_content }
    end
  end
end
