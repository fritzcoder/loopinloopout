class AudioFileController < ApplicationController
  def index
    @audioFiles = AudioFile.all
    
    respond_to do |format|
        format.html  # index.html.erb
        format.json  { render :json => @audioFiles }
    end
    
  end
end
