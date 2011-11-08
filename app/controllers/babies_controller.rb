class BabiesController < ApplicationController
  before_filter :authenticate_user!

  # GET /babies/1
  # GET /babies/1.json
  def show
    @baby = Baby.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @baby }
    end
  end

  # GET /babies/new
  # GET /babies/new.json
  def new
    @baby = current_user.babies.new
    @timeline = Timeline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baby }
    end
  end

  # GET /babies/1/edit
  def edit
    @baby = current_user.babies.find(params[:id])
  end

  # POST /babies
  # POST /babies.json
  def create
    @baby = current_user.babies.new(params[:baby])
    @baby.build_timeline({:title => @baby.nick_name, :alias => params[:timeline][:alias], :status => 1, :user => current_user})
    respond_to do |format|
      if @baby.save
        format.html { redirect_to home_path, notice: 'Baby was successfully created.' }
        format.json { render json: @baby, status: :created, location: @baby }
      else
        format.html { render action: "new" }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /babies/1
  # PUT /babies/1.json
  def update
    @baby = Baby.find(params[:id])

    respond_to do |format|
      if @baby.update_attributes(params[:baby])
        format.html { redirect_to @baby, notice: 'Baby was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @baby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /babies/1
  # DELETE /babies/1.json
  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy

    respond_to do |format|
      format.html { redirect_to babies_url }
      format.json { head :ok }
    end
  end
end
