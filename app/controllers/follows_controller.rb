class FollowsController < ApplicationController
  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @follows }
    end
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
    @follow = Follow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @follow }
    end
  end

  # GET /follows/new
  # GET /follows/new.json
  def new
    @follow = Follow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @follow }
    end
  end

  # GET /follows/1/edit
  def edit
    @follow = Follow.find(params[:id])
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new()
    @follow.luser_id = current_user.luser.id
    fluser = Luser.find(:first, :conditions => {:name => params[:username]})
    @follow.following_luser_id = fluser.id
    
    current = Follow.find(:first, :conditions => {:luser_id => current_user.luser.id, 
      :following_luser_id => fluser.id })
    
    respond_to do |format|
      if current != nil
        current.destroy
        format.json { head :no_content }
      elsif @follow.save
        recieving_user = Luser.find(@follow.following_luser_id)
        Notification.add(@follow, nil,"follow", recieving_user, current_user.luser)
        LuserMailer.new_follower(User.find(fluser.user_id), current_user.luser).deliver
        format.html { redirect_to @follow, notice: 'You are now following ' + fluser.name }
        format.json { render json: @follow, status: :created, location: @follow }
      else
        format.html { render action: "new" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /follows/1
  # PUT /follows/1.json
  def update
    @follow = Follow.find(params[:id])

    respond_to do |format|
      if @follow.update_attributes(params[:follow])
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to follows_url }
      format.json { head :no_content }
    end
  end
end
