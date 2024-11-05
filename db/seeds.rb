# Create a sample product
tshirt = Product.create!(
  name: 'T-Shirt',
  description: 'Comfortable cotton t-shirt',
  price: 19.99
)

# Add variants (sizes) to the product
tshirt.variants.create!(size: 'S', stock: 10)
tshirt.variants.create!(size: 'M', stock: 5)
tshirt.variants.create!(size: 'L', stock: 2)AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?