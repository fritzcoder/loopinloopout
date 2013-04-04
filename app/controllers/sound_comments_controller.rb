class SoundCommentsController < ApplicationController
  # GET /sound_comments
  # GET /sound_comments.json
  def index
    @sound_comments = SoundComment.find(:all, :conditions => {:sound_file_id => params[:sound_file_id]})
    @sound_comment = SoundComment.new
    @sound_file = SoundFile.find(params[:sound_file_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sound_comments }
    end
  end

  # GET /sound_comments/1
  # GET /sound_comments/1.json
  def show
    @sound_comment = SoundComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound_comment }
    end
  end

  # GET /sound_comments/new
  # GET /sound_comments/new.json
  def new
    @sound_comment = SoundComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound_comment }
    end
  end

  # GET /sound_comments/1/edit
  def edit
    @sound_comment = SoundComment.find(params[:id])
  end

  # POST /sound_comments
  # POST /sound_comments.json
  def create
    @sound_comment = SoundComment.new(params[:sound_comment])
    @sound_file = SoundFile.find(params[:sound_file_id])
    @sound_comment.sound_file_id = @sound_file.id
    @sound_comment.luser_id = current_user.luser.id

    respond_to do |format|
      if @sound_comment.save
        format.html { redirect_to sound_file_sound_comments_path(@sound_file), 
          notice: 'Sound comment was successfully created.' }
        format.json { render json: @sound_comment, status: :created, location: @sound_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @sound_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sound_comments/1
  # PUT /sound_comments/1.json
  def update
    @sound_comment = SoundComment.find(params[:id])

    respond_to do |format|
      if @sound_comment.update_attributes(params[:sound_comment])
        format.html { redirect_to @sound_comment, notice: 'Sound comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_comments/1
  # DELETE /sound_comments/1.json
  def destroy
    @sound_comment = SoundComment.find(params[:id])
    @sound_comment.destroy

    respond_to do |format|
      format.html { redirect_to sound_comments_url }
      format.json { head :no_content }
    end
  end
end
