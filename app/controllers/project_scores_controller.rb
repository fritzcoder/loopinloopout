class ProjectScoresController < ApplicationController
  # GET /project_scores
  # GET /project_scores.json
  def index
    @project_scores = ProjectScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_scores }
    end
  end

  # GET /project_scores/1
  # GET /project_scores/1.json
  def show
    @project_score = ProjectScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_score }
    end
  end

  # GET /project_scores/new
  # GET /project_scores/new.json
  def new
    @project_score = ProjectScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_score }
    end
  end

  # GET /project_scores/1/edit
  def edit
    @project_score = ProjectScore.find(params[:id])
  end

  # POST /project_scores
  # POST /project_scores.json
  def create
    @project_score = ProjectScore.new(params[:project_score])

    respond_to do |format|
      if @project_score.save
        format.html { redirect_to @project_score, notice: 'Project score was successfully created.' }
        format.json { render json: @project_score, status: :created, location: @project_score }
      else
        format.html { render action: "new" }
        format.json { render json: @project_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_scores/1
  # PUT /project_scores/1.json
  def update
    @project_score = ProjectScore.find(params[:id])

    respond_to do |format|
      if @project_score.update_attributes(params[:project_score])
        format.html { redirect_to @project_score, notice: 'Project score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_scores/1
  # DELETE /project_scores/1.json
  def destroy
    @project_score = ProjectScore.find(params[:id])
    @project_score.destroy

    respond_to do |format|
      format.html { redirect_to project_scores_url }
      format.json { head :no_content }
    end
  end
end
