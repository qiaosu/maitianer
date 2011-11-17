class BabiesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @date = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today
    @baby = Baby.find(params[:id])
    @photos_per_day = @baby.photos.group("date(created_at)").published.all()

    respond_with @baby
  end

  # GET /babies/new
  # GET /babies/new.json
  def new
    @baby = Baby.new

    respond_with @baby
  end

  # GET /babies/1/edit
  def edit
    @baby = current_user.babies.find(params[:id])
  end

  # POST /babies
  # POST /babies.json
  def create
    @baby = current_user.babies.new(params[:baby])
    @baby.build_timeline({:title => @baby.nick_name, :status => 1, :user => current_user})
    flash[:notice] = 'Baby was successfully created.' if @baby.save
    
    respond_with @baby, :status => :created
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
