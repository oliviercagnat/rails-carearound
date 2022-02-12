# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB..."
Cosmetic.destroy_all
Review.destroy_all
User.destroy_all

puts "Creating users..."

  User.create!(
    email: "careuser@gmail.com",
    password: "123456",
    name: "Jane Doe",
    skin_type: "Dry and fair",
    country: "UK",
    avatar: "https://kitt.lewagon.com/placeholder/users/arthur-littm"
  )

  puts "User #{user.name} created!"
  puts "Creating Cosmetics..."

  Cosmetic.create!(
    name: "Repair and Replenish",
    description: "Repair & Care Body Lotion cares for your very dry skin & works in balance with its Microbiome. Skin's Microbiome is like an "invisible layer" of natural bacteria on your body - they're important for maintaining skin's health & beauty. This repairing NIVEA body lotion with Dexpanthenol strengthens the natural barrier of your skin, instantly calms irritated areas and gives you relief from very dry, tight skin for 72h with regular use. It is infused with 'Intense Moisture Serum'; a unique composition of skin’s own moisturiser, moisture-locking lipids and care providing oils that bind and hold water in the skin so the moisture cannot evaporate easily into the surrounding area. Try Repair & Care Lotion body cream for 72h relief from dry, tight skin & works in balance with its microbiome.",
    brand: "Nivea",
    average_price: "¥1899",
    category: "Skin care"
  )

  Cosmetic.create!(
    name: "Honey Bee Lip Balm",
    description: "Loved by nature and perfectly sweet. Kind of like you. This natural balm helps nourish your dry lips with a touch of golden Honey and Vitamin E, leaving them soft, supple and super happy",
    brand: "Burts Bees",
    average_price: "¥3007",
    category: "Lip care"
  )

  Cosmetic.create!(
    name: "Double Wear Stay-in-Place Foundation",
    description: "A 24-hour liquid foundation with a flawless, natural, matte finish that unifies uneven skin tone and covers imperfections with buildable coverage.",
    brand: "Estee Lauder",
    average_price: "¥5050",
    category: "Skin care"
  )

  Cosmetic.create!(
    name: "Black Ecstasy Mascara ",
    description: "Black Ecstasy features a lightweight formula and unique brush that achieve the ultimate volume, length, and curl in a flash. The cylindrical, multidirectional brush is designed to capture and coat every lash. Formulated with four patented, multi-effect waxes for seamless application, this mascara is formulated with exclusive color-boosting polymers to coat lashes with intense black pigment.",
    brand: "Armani",
    average_price: "¥10,988",
    category: "Eye care"
  )

  Cosmetic.create!(
    name: "NYX PROFESSIONAL MAKEUP HD Studio Photogenic Concealer Wand",
    description: "This concealer covers blemishes, imperfections, skin discoloration, dark circles under eye, and is safe for all skin types; can also be used as a contouring concealer to sculpt chin and cheekbones",
    brand: "NYX PROFESSIONAL MAKEUP",
    average_price: "¥5899",
    category: "Skin care"
  )


  puts "#{Cosmetic.count} cosmetics created!"
  puts "Creating Ingredients..."


  Ingredient.create!(
    name: "Rose water",
    description: "Rose water is a liquid made by steeping rose petals in water or distilling rose petals with steam.",
    pros: "Helps soothe skin irritation",
    cons: "Not recommended to those with a rose allergy",
  )

  Ingredient.create!(
    name: "Paraben",
    description: "Parabens are a family of related chemicals that are commonly used as preservatives in cosmetic products. Preservatives may be used in cosmetics to prevent the growth of harmful bacteria and mold, in order to protect both the products and consumers.",
    pros: "Allows make-up to last longer",
    cons: "Can cause skin irritation on sensitive skin",
  )

  Ingredient.create!(
    name: "Sulphates",
    description: "Sulphates are ingredients synthesized in the laboratory from fatty alcohol",
    pros: "They are cleaning, foaming and easy to rince. They leave a clean sensation.",
    cons: "For people with sensitive skin, sulfates may clog pores and cause acne.",
  )

