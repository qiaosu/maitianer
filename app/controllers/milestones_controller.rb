class MilestonesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized_user, :only => [:update, :destroy]
  
  # GET /milestones
  # GET /milestones.json
  def index
    @baby = Baby.find(params[:baby_id])
    @milestones = @baby.milestones

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.json
  def new
    @baby = Baby.find(params[:baby_id])
    @milestone = Milestone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @baby = Baby.find(params[:baby_id])
    @milestone = @baby.milestones.find(params[:id])
  end

  # POST /milestones
  # POST /milestones.json
  def create
    @baby = Baby.find(params[:baby_id])
    @milestone = @baby.milestones.build(params[:milestone])

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to baby_milestones_path(@baby), notice: 'Milestone was successfully created.' }
        format.json { render json: @milestone, status: :created, location: @milestone }
      else
        format.html { render action: "new" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.json
  def update
    @baby = Baby.find(params[:baby_id])
    @milestone = @baby.milestones.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to baby_milestones_path(@baby), notice: 'Milestone was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @baby = Baby.find(params[:baby_id])
    @milestone = @baby.milestones.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to baby_milestones_url(@baby) }
      format.json { head :ok }
    end
  end
  
  private
    def authorized_user
      @milestone = current_user.babies.first.milestones.find_by_id(params[:id])
      redirect_to root_path if @milestone.nil?
    end
end
