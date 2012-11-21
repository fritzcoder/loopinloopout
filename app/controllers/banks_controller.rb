class BanksController < ApplicationController
  # GET /sound_banks
  # GET /sound_banks.json
  def index
    @banks = Bank.all
    @sound_files = SoundFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banks }
    end
  end
  
  def search
    @banks = Bank.all
    @sound_files = SoundFile.all

    respond_to do |format|
      format.html { render "index.html.erb" }
      format.json { render json: @banks }
    end
  end
  
  def update_subtypes
    types = SoundType.find(:all, :conditions => { :sound_type_id => params[:type_id] })
    @t = types.map{|a| [a.name, a.id]}.insert(0, "None")
    @sound_file = SoundFile.find(params[:file_id])
    @sound_file_types = @sound_file.sound_file_types.map {|i| i.sound_type_id }
  end
  
  def update_files
    files = SoundFileType.find(:all, :conditions => { :sound_type_id => params[:type_id] })
    #files = files + SoundFileType.find(:all, :conditions => {:sound_type_id => params[:sub_type_id]})
    @sound_files = SoundFile.find(1,2)
    #@sound_files = files.map {|f| f.sound_file }.insert()
  end
  
  # GET /banks/1
  # GET /banks/1.json
  def show
    @bank = Bank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bank }
    end
  end

  # GET /sound_banks/new
  # GET /sound_banks/new.json
  def new
    @bank = Bank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bank }
    end
  end

  # GET /sound_banks/1/edit
  def edit
    @bank = Bank.find(params[:id])
  end

  # POST /sound_banks
  # POST /sound_banks.json
  def create
    @bank = Bank.new(params[:bank])

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'Sound bank was successfully created.' }
        format.json { render json: @bank, status: :created, location: @bank }
      else
        format.html { render action: "new" }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sound_banks/1
  # PUT /sound_banks/1.json
  def update
    @bank = Bank.find(params[:id])

    respond_to do |format|
      if @bank.update_attributes(params[:bank])
        format.html { redirect_to @bank, notice: 'Sound bank was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_banks/1
  # DELETE /sound_banks/1.json
  def destroy
    @bank = Bank.find(params[:id])
    @bank.destroy

    respond_to do |format|
      format.html { redirect_to banks_url }
      format.json { head :no_content }
    end
  end
end
