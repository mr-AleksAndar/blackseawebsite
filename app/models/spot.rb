class Spot < ApplicationRecord
    def image_asset_url
        if image_url.present?
          ActionController::Base.helpers.asset_path("spot_images/#{image_url}")
        else
          nil
        end
    end
    extend FriendlyId
  friendly_id :name, use: :slugged

  # Optionally, if you want to regenerate the slug when the name changes:
  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
