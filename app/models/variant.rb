class Variant < ApplicationRecord
  belongs_to :product

  def size_with_stock
    "#{size} (#{stock} in stock)"
  end
end