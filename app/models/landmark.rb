class Landmark < ApplicationRecord
    before_validation :generate_slug
    def image_asset_url
        if image_url.present?
          ActionController::Base.helpers.asset_path("landmark_images/#{image_url}")
        else
          nil
        end
      end
    extend FriendlyId
friendly_id :name, use: :slugged
    def generate_slug
      self.slug ||= name.parameterize if name
    end
  end
  def should_generate_new_friendly_id?
    name_changed? || super
    end
