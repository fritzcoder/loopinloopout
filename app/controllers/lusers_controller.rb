class LusersController < ApplicationController
  skip_before_filter :check_if_username, :only => [:new, :create]
  # GET /lusers
  # GET /lusers.json
  def index
    @lusers = Luser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lusers }
    end
  end

  # GET /lusers/1
  # GET /lusers/1.json
  def show
    @luser = Luser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @luser }
    end
  end

  # GET /lusers/new
  # GET /lusers/new.json
  def new
    @luser = Luser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @luser }
    end
  end

  # GET /lusers/1/edit
  def edit
    @luser = Luser.find(params[:id])
  end

  # POST /lusers
  # POST /lusers.json
  def create
    @luser = Luser.new(params[:luser])
    @luser.user_id = current_user.id

    respond_to do |format|
      if @luser.save
        format.html { redirect_to @luser, notice: 'Luser was successfully created.' }
        format.json { render json: @luser, status: :created, location: @luser }
      else
        format.html { render action: "new" }
        format.json { render json: @luser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lusers/1
  # PUT /lusers/1.json
  def update
    @luser = Luser.find(params[:id])

    respond_to do |format|
      if @luser.update_attributes(params[:luser])
        format.html { redirect_to @luser, notice: 'Luser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @luser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lusers/1
  # DELETE /lusers/1.json
  def destroy
    @luser = Luser.find(params[:id])
    @luser.destroy

    respond_to do |format|
      format.html { redirect_to lusers_url }
      format.json { head :no_content }
    end
  end
end
