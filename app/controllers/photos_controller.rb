class PhotosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized_user, :only => [:update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:upload]
  
  def index
    @baby = Baby.find(params[:baby_id])
    @photos = @baby.photos.published

    respond_with(@baby, @photos)
  end

  def show
    @baby = Baby.find(params[:baby_id])
    @photo = @baby.photos.find(params[:id])

    respond_with(@baby, @photo)
  end

  def new
    @baby = Baby.find(params[:baby_id])
    @photo = Photo.new

    respond_with(@baby, @photo)
  end
  
  def upload
    @baby = Baby.find(params[:baby_id])
    @photo = @baby.photos.create(params[:photo].merge(:status => 1))
    render :upload, :layout => false
  end
  
  def publish
    @baby = Baby.find(params[:baby_id])
    @photo = @baby.photos.find(params[:id])
    @photo.update_attributes(params[:photo].merge(:status => 2))
    redirect_to baby_photos_path(@baby)
  end

  def edit
    @baby = Baby.find(params[:baby_id])
    @photo = @baby.photos.find(params[:id])
    
    respond_with(@baby, @photo)
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @photo = @baby.photos.new(params[:photo])
    flash[:notice] = 'Photo was successfully created.' if @photo.save
    
    respond_with(@baby, @photo)
  end

  def update
    @photo = Photo.find(params[:id])
    flash[:notice] = 'Photo was successfully updated.' if @photo.update_attributes(params[:photo])
    
    respond_with(@baby, @photo, :location => baby_path(@baby), :head => :ok)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_with @photo, :location => baby_photos_path
  end
  
  private
    def authorized_user
      @photo = current_user.babies.first.photos.find_by_id(params[:id])
      redirect_to root_path if @photo.nil?
    end
end
