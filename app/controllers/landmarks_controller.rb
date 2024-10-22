class LandmarksController < ApplicationController
  def index
    @landmarks = Landmark.all

    @landmark_data = @landmarks.map do |landmark|
      landmark_attributes = landmark.attributes.slice(
        'id', 'name', 'description', 'latitude', 'longitude',
        'type', 'url', 'image_url', 'slug'
      )
      # Generate the asset path using the view context (available in controllers)
      landmark_attributes['image_asset_url'] = view_context.asset_path("landmark_images/#{landmark.image_url}") if landmark.image_url.present?
      landmark_attributes['path'] = landmark_path(landmark)
      landmark_attributes
    end
  end

  def show
    @landmark = Landmark.find_by(slug: params[:id])
  end
end

private

  def set_landmark
    @landmark = Landmark.friendly.find(params[:id])
  end

  def spot_params
    params.require(:landmark).permit(
      :name,
      :description,
      :latitude,
      :longitude,
      :type,
      :url,
      :image_url,
      :slug
    )
  end
end