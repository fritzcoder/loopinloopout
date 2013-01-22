class VotesController < ApplicationController
  def create
    sound_file_id = params[:sound_file_id]
    project_id = params[:project_id]
    
    user = Luser.find(:first, :conditions => { :name => params[:username]})
    
    current = Vote.find(:first, :conditions => {:sound_file_id => sound_file_id, :luser_id => user.id, 
      :project_id => project_id })
    
    voted = nil
    if current != nil 
      voted = Vote.find(:first, :conditions => {:luser_id => user.id, 
        :project_id => project_id })
    end
    
    @vote = Vote.new
    @vote.project_id = project_id
    @vote.sound_file_id = sound_file_id
    @vote.luser_id = user.id
  
    respond_to do |format|
      if current != nil
        current.destroy
        format.json { head :no_content }
      elsif @vote.save
        #format.html { redirect_to @bank_bookmark, notice: 'Bank bookmark was successfully created.' }
        format.json { render json: @vote, status: :created }
      else
        #format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end
end
