class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all
  
    @spots_data = @spots.map do |spot|
      spot_attributes = spot.attributes.slice(
        'id', 'name', 'description', 'latitude', 'longitude',
        'wave_type', 'seabed_type', 'swell_window', 'consistency',
        'break_type', 'image_url'
      )
      spot_attributes['image_asset_url'] = view_context.asset_path("spot_images/#{spot.image_url}") if spot.image_url.present?
      spot_attributes['path'] = spot_path(spot)
      spot_attributes
    end
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def edit
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to @spot, notice: 'Spot was successfully created.'
    else
      render :new
    end
  end

  def update
    if @spot.update(spot_params)
      redirect_to @spot, notice: 'Spot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to spots_url, notice: 'Spot was successfully destroyed.'
  end

  private

  def set_spot
    @spot = Spot.friendly.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(
      :name,
      :description,
      :latitude,
      :longitude,
      :wave_type,
      :seabed_type,
      :swell_window,
      :consistency,
      :break_type,
      :image_url,
      :slug
    )
  end
end