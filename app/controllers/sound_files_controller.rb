class SoundFilesController < ApplicationController
before_filter :authenticate_user!

  def update_listen_count
    sound_file = SoundFile.find(params[:id])
    sound_file.listen_count = sound_file.listen_count + 1
    sound_file.save
  end
  
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
    @bank = Bank.find(params[:bank_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound_file }
    end
  end

  # GET /sound_files/1/edit
  def edit
    @sound_file = SoundFile.find(params[:id])
    @bank = Bank.find(params[:bank_id])
    @user_name = params[:username]
    @user = Luser.find(:first, :conditions => {:name => params[:username]})
    @bank_select = LuserBank.find(:all, :conditions => {:luser_id => @user.id}).map { |b| b.bank }
    #@sound_file_types = SoundTypes.find(:all, :conditions => {:sound_type_id => nil})
    @sound_file_types = @sound_file.sound_file_types.map {|i| i.sound_type_id }
    @banks = @sound_file.bank_files.map {|i| i.bank_id }
    @softwares = @sound_file.sound_file_softwares.map {|i| i.software_id }
    @modes = @sound_file.sound_file_modes.map {|i| i.mode_id }
  end

  # POST /sound_files
  # POST /sound_files.json
  def create
    @sound_file = SoundFile.new(params[:sound_file])
    @sound_file.type = "SoundFile"
    @sound_file.created_by = current_user.luser.name
    bank_id = params[:bank_id]
    @bank = Bank.find(params[:bank_id])

    respond_to do |format|
      if @sound_file.save
        bank_file = BankFile.new
        bank_file.bank_id = bank_id
        bank_file.sound_file_id = @sound_file.id
        bank_file.save
        
        if @sound_file.audio != nil
          Runner.generate_waveform(@sound_file)
        end
        format.html { redirect_to edit_bank_sound_file_path(current_user.luser.name, @bank, @sound_file), notice: 'Sound file was successfully created.' }
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
    @bank = Bank.find(params[:bank_id])
    @user_name = params[:username]

    respond_to do |format|
      if @sound_file.update_attributes(params[:sound_file])
        @sound_file.sound_file_types.each { |i| i.destroy }
        #logger.debug "------------#{params[:type]}----------"
        @sound_file.sound_file_modes.each {|i| i.destroy }
        @sound_file.bank_files.each {|i| i.destroy }
        @sound_file.sound_file_softwares.each { |i| i.destroy }
        SoundFileSoftware.save_software_types(@sound_file.id, params[:software][:id])
        BankFile.save_bank_types(@sound_file.id, params[:bank][:id])
        SoundFileType.save_file_types(@sound_file.id, params[:type][:id])
        SoundFileMode.save_mode_types(@sound_file.id, params[:type][:id])
        #SoundFileType.save_file_types(@sound_file.id, params[:sub_type])
        
        if @sound_file.preview != nil
          Runner.generate_waveform(@sound_file)
        end
        
        format.html { redirect_to edit_bank_sound_file_path("ontehfritz", @bank, @sound_file), 
          notice: 'Sound file was successfully updated.' }
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
