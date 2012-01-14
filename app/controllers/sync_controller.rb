class SyncController < ApplicationController
  before_filter :authenticate_user!
  
  def start
    @sync_record = SyncRecord.create(:started_at => Date.today, :user => current_user, :user_agent => request.env['HTTP_USER_AGENT'])
    respond_with @sync_record
  end

  def sync_babies
    logger.info params[:babies]
  end

  def sync_photos
    loggin.error 'test'
    logger.info params[:photos].size
  end

  def sync_milestons
    logger.info params[:milestons]
  end

  def finish
    @sync_record = SyncRecord.find(params[:id])
    @sync_record.update_attributes(:finished_at => Date.today)
  end

end
