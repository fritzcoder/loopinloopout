class BankBookmarksController < ApplicationController
  # GET /bank_bookmarks
  # GET /bank_bookmarks.json
  def index
    @bank_bookmarks = BankBookmark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bank_bookmarks }
    end
  end

  # GET /bank_bookmarks/1
  # GET /bank_bookmarks/1.json
  def show
    @bank_bookmark = BankBookmark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bank_bookmark }
    end
  end

  # GET /bank_bookmarks/new
  # GET /bank_bookmarks/new.json
  def new
    @bank_bookmark = BankBookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bank_bookmark }
    end
  end

  # GET /bank_bookmarks/1/edit
  def edit
    @bank_bookmark = BankBookmark.find(params[:id])
  end

  # POST /bank_bookmarks
  # POST /bank_bookmarks.json
  #this will toggle a bookmark
  #if no bookmark exists create it
  #if a bookmark does exist delete it
  def create
    bank_id = params[:bank_id]
    user = Luser.find(:first, :conditions => { :name => params[:username]})
    bank = Bank.find(bank_id)
    
    current = BankBookmark.find(:first, :conditions => {:bank_id => bank_id, :luser_id => user.id })
    
    @bank_bookmark = BankBookmark.new
    @bank_bookmark.bank_id = bank_id
    @bank_bookmark.luser_id = user.id
  
    respond_to do |format|
      if current != nil
        current.destroy
        format.json { head :no_content }
      elsif @bank_bookmark.save
        Notification.add(bank, nil,"bookmark", user, current_user.luser)
        #format.html { redirect_to @bank_bookmark, notice: 'Bank bookmark was successfully created.' }
        format.json { render json: @bank_bookmark, status: :created }
      else
        #format.html { render action: "new" }
        format.json { render json: @bank_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bank_bookmarks/1
  # PUT /bank_bookmarks/1.json
  def update
    @bank_bookmark = BankBookmark.find(params[:id])

    respond_to do |format|
      if @bank_bookmark.update_attributes(params[:bank_bookmark])
        format.html { redirect_to @bank_bookmark, notice: 'Bank bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bank_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_bookmarks/1
  # DELETE /bank_bookmarks/1.json
  def destroy
    @bank_bookmark = BankBookmark.find(params[:id])
    @bank_bookmark.destroy

    respond_to do |format|
      format.html { redirect_to bank_bookmarks_url }
      format.json { head :no_content }
    end
  end
end
