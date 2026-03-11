class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :variants, through: :order_items

  validates :name, :email, :phone, :address, :city, :postal_code, presence: true

  # Compute total from items before save
  before_save :compute_total

  private

  def compute_total
    self.total_cents = order_items.sum { |item| item.unit_price_cents * item.quantity }
  end
end