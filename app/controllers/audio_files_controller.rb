class AudioFilesController < ApplicationController
  def index
    @audioFiles = AudioFile.all
    
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @audioFiles }
    end
  end
  
  def new 
    @audio = AudioFile.new 
    
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @audio }
    end
  end
  
  def create
    @audio = AudioFile.create( params[:audio_file] )
    
    respond_to do |format|
      if @audio.save
        format.html  { redirect_to(@audio,
                        :notice => 'Post was successfully created.') }
        format.json  { render :json => @audio,
                        :status => :created, :location => @audio }
      else
          format.html  { render :action => "new" }
          format.json  { render :json => @audio.errors,
                        :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @audio = AudioFile.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json {render :json => @audio }
    end
  end
  
end
