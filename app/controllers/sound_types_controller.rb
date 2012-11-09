class SoundTypesController < ApplicationController
  # GET /sound_types
  # GET /sound_types.json
  def index
    @sound_types = SoundType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sound_types }
    end
  end

  # GET /sound_types/1
  # GET /sound_types/1.json
  def show
    @sound_type = SoundType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound_type }
    end
  end

  # GET /sound_types/new
  # GET /sound_types/new.json
  def new
    @sound_type = SoundType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound_type }
    end
  end

  # GET /sound_types/1/edit
  def edit
    @sound_type = SoundType.find(params[:id])
  end

  # POST /sound_types
  # POST /sound_types.json
  def create
    @sound_type = SoundType.new(params[:sound_type])

    respond_to do |format|
      if @sound_type.save
        format.html { redirect_to @sound_type, notice: 'Sound type was successfully created.' }
        format.json { render json: @sound_type, status: :created, location: @sound_type }
      else
        format.html { render action: "new" }
        format.json { render json: @sound_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sound_types/1
  # PUT /sound_types/1.json
  def update
    @sound_type = SoundType.find(params[:id])

    respond_to do |format|
      if @sound_type.update_attributes(params[:sound_type])
        format.html { redirect_to @sound_type, notice: 'Sound type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_types/1
  # DELETE /sound_types/1.json
  def destroy
    @sound_type = SoundType.find(params[:id])
    @sound_type.destroy

    respond_to do |format|
      format.html { redirect_to sound_types_url }
      format.json { head :no_content }
    end
  end
end
