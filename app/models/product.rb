class Product < ApplicationRecord
  before_validation :generate_slug
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :tags
  has_many :variants, dependent: :destroy

  # Returns the asset‐hosted image path, or nil
  def image_asset_url
    if image_url.present?
      ActionController::Base.helpers.asset_path("product_images/#{image_url}")
    else
      nil
    end
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end