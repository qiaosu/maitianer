class TimelinesController < ApplicationController
  
  def edit
    @baby = Baby.find(params[:baby_id])
    @timeline = @baby.timeline
  end

  def update
    @timeline = Timeline.find(params[:id])
    if @timeline.update_attributes(params[:timeline])
      redirect_to @timeline, :notice  => "Successfully updated timeline."
    else
      render :action => 'edit'
    end
  end

  def show
    @timeline = Timeline.find(params[:id])
  end
  
end
