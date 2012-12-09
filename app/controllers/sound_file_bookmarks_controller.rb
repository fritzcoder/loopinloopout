class SoundFileBookmarksController < ApplicationController
  # GET /sound_file_bookmarks
  # GET /sound_file_bookmarks.json
  def index
    @sound_file_bookmarks = SoundFileBookmark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sound_file_bookmarks }
    end
  end

  # GET /sound_file_bookmarks/1
  # GET /sound_file_bookmarks/1.json
  def show
    @sound_file_bookmark = SoundFileBookmark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound_file_bookmark }
    end
  end

  # GET /sound_file_bookmarks/new
  # GET /sound_file_bookmarks/new.json
  def new
    @sound_file_bookmark = SoundFileBookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound_file_bookmark }
    end
  end

  # GET /sound_file_bookmarks/1/edit
  def edit
    @sound_file_bookmark = SoundFileBookmark.find(params[:id])
  end

  # POST /sound_file_bookmarks
  # POST /sound_file_bookmarks.json
  def create
    sound_file_id = params[:sound_file_id]
    user = Luser.find(:first, :conditions => { :name => params[:username]})
    
    current = SoundFileBookmark.find(:first, :conditions => {:sound_file_id => sound_file_id, :luser_id => user.id })
    
    @sound_file_bookmark = SoundFileBookmark.new
    @sound_file_bookmark.luser_id = user.id
    @sound_file_bookmark.sound_file_id = sound_file_id 

    respond_to do |format|
      if current != nil
        current.destroy
        format.json { head :no_content }
      elsif @sound_file_bookmark.save
        #format.html { redirect_to @sound_file_bookmark, notice: 'Sound file bookmark was successfully created.' }
        format.json { render json: @sound_file_bookmark, status: :created }
      else
        #format.html { render action: "new" }
        format.json { render json: @sound_file_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sound_file_bookmarks/1
  # PUT /sound_file_bookmarks/1.json
  def update
    @sound_file_bookmark = SoundFileBookmark.find(params[:id])

    respond_to do |format|
      if @sound_file_bookmark.update_attributes(params[:sound_file_bookmark])
        format.html { redirect_to @sound_file_bookmark, notice: 'Sound file bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound_file_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_file_bookmarks/1
  # DELETE /sound_file_bookmarks/1.json
  def destroy
    @sound_file_bookmark = SoundFileBookmark.find(params[:id])
    @sound_file_bookmark.destroy

    respond_to do |format|
      format.html { redirect_to sound_file_bookmarks_url }
      format.json { head :no_content }
    end
  end
end
