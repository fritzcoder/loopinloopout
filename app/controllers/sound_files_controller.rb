class SoundFilesController < ApplicationController
  # GET /sound_files
  # GET /sound_files.json
  def index
    @sound_files = SoundFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sound_files }
    end
  end

  # GET /sound_files/1
  # GET /sound_files/1.json
  def show
    @sound_file = SoundFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound_file }
    end
  end

  # GET /sound_files/new
  # GET /sound_files/new.json
  def new
    @sound_file = SoundFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound_file }
    end
  end

  # GET /sound_files/1/edit
  def edit
    @sound_file = SoundFile.find(params[:id])
  end

  # POST /sound_files
  # POST /sound_files.json
  def create
    @sound_file = SoundFile.new(params[:sound_file])

    respond_to do |format|
      if @sound_file.save
        format.html { redirect_to @sound_file, notice: 'Sound file was successfully created.' }
        format.json { render json: @sound_file, status: :created, location: @sound_file }
      else
        format.html { render action: "new" }
        format.json { render json: @sound_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sound_files/1
  # PUT /sound_files/1.json
  def update
    @sound_file = SoundFile.find(params[:id])

    respond_to do |format|
      if @sound_file.update_attributes(params[:sound_file])
        format.html { redirect_to @sound_file, notice: 'Sound file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_files/1
  # DELETE /sound_files/1.json
  def destroy
    @sound_file = SoundFile.find(params[:id])
    @sound_file.destroy

    respond_to do |format|
      format.html { redirect_to sound_files_url }
      format.json { head :no_content }
    end
  end
end
