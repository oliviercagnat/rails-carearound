require "json"
require "open-uri"
import 'results.json'

DEFAULT_IMAGE = "https://4.imimg.com/data4/MJ/EN/MY-4313393/nourishing-face-cream-500x500.jpg"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#!!!! Hard coded seeds !!!!!

puts "Cleaning DB..."
Review.destroy_all
Cosmetic.destroy_all
User.destroy_all
# Ingredient.destroy_all

puts "Creating users..."

  user = User.create!(
    email: "careuser@gmail.com",
    password: "123456",
    name: "Jane Doe",
    skin_type: "Dry and fair",
    country: "UK",
    # avatar: "https://kitt.lewagon.com/placeholder/users/arthur-littm"
  )

  puts "User #{user.name} created!"
  puts "Creating Cosmetics..."

  # cosmetic1 = Cosmetic.create!(
  #   name: "Repair and Care",
  #   description: "Repair & Care Body Lotion cares for your very dry skin & works in balance with its Microbiome. Skin's Microbiome is like an invisible layer of natural bacteria on your body - they're important for maintaining skin's health & beauty. This repairing NIVEA body lotion with Dexpanthenol strengthens the natural barrier of your skin, instantly calms irritated areas and gives you relief from very dry, tight skin for 72h with regular use. It is infused with 'Intense Moisture Serum'; a unique composition of skin’s own moisturiser, moisture-locking lipids and care providing oils that bind and hold water in the skin so the moisture cannot evaporate easily into the surrounding area. Try Repair & Care Lotion body cream for 72h relief from dry, tight skin & works in balance with its microbiome.",
  #   brand: "Nivea",
  #   average_price: 1899,
  #   category: "Skin care"
  # )
  # image1 = URI.open("https://images-us.nivea.com/-/media/media-center-items/6/5/e/212376-screen.jpg")
  # cosmetic1.cosmetic_image.attach(io: image1, filename: "picture")
  # puts "created Cosmetic 1"

  # cosmetic2 = Cosmetic.create!(
  #   name: "Honey Bee Lip Balm",
  #   description: "Loved by nature and perfectly sweet. Kind of like you. This natural balm helps nourish your dry lips with a touch of golden Honey and Vitamin E, leaving them soft, supple and super happy",
  #   brand: "Burts Bees",
  #   average_price: 3007,
  #   category: "Lip care"
  # )
  # image2 = URI.open("https://static.thcdn.com/images/large/original//productimg/1600/1600/10302464-1554760859219636.jpg")
  # cosmetic2.cosmetic_image.attach(io: image2, filename: "picture")
  # puts "created Cosmetic 2"

  # cosmetic3 = Cosmetic.create!(
  #   name: "Double Wear Stay-in-Place Foundation",
  #   description: "A 24-hour liquid foundation with a flawless, natural, matte finish that unifies uneven skin tone and covers imperfections with buildable coverage.",
  #   brand: "Estee Lauder",
  #   average_price: 5050,
  #   category: "Skin care",
  # )
  # image3 = URI.open("https://www.esteelauder.com/media/export/cms/products/640x640/el_sku_YA6FCT_640x640_0.jpg")
  # cosmetic3.cosmetic_image.attach(io: image3, filename: "picture")
  # puts "created Cosmetic 3"

  # cosmetic4 = Cosmetic.create!(
  #   name: "Black Ecstasy Mascara ",
  #   description: "Black Ecstasy features a lightweight formula and unique brush that achieve the ultimate volume, length, and curl in a flash. The cylindrical, multidirectional brush is designed to capture and coat every lash. Formulated with four patented, multi-effect waxes for seamless application, this mascara is formulated with exclusive color-boosting polymers to coat lashes with intense black pigment.",
  #   brand: "Armani",
  #   average_price: 10988,
  #   category: "Eye care"
  # )
  # image4 = URI.open("https://canary.contestimg.wish.com/api/webimage/589d0fc6ae37de52328d9dce-large.jpg?cache_buster=b46d423327769ef90dcff369143e0acc")
  # cosmetic4.cosmetic_image.attach(io: image4, filename: "picture")
  # puts "created Cosmetic 4"

  # cosmetic5 = Cosmetic.create!(
  #   name: "NYX PROFESSIONAL MAKEUP HD Studio Photogenic Concealer Wand",
  #   description: "This concealer covers blemishes, imperfections, skin discoloration, dark circles under eye, and is safe for all skin types; can also be used as a contouring concealer to sculpt chin and cheekbones",
  #   brand: "NYX PROFESSIONAL MAKEUP",
  #   average_price: 5899,
  #   category: "Skin care"
  # )
  # image5 = URI.open("https://adn-static1.nykaa.com/media/catalog/product/8/0/800897123284_01_1.jpg")
  # cosmetic5.cosmetic_image.attach(io: image5, filename: "picture")
  # puts "created Cosmetic 5"



  #!!!! API Seeds below !!!!!!!
  # puts Dir.pwd # => is it really usefull ?


  file_path = File.join(Rails.public_path.join('Cosmetics_file.json')) #=> In order to speed up the process I downloded the file (Also there were issues from too many pull requests)
  json = File.read(file_path)

# json = URI.open("http://makeup-api.herokuapp.com/api/v1/products.json").read => original file
  item_info = JSON.parse(json)


    item_info.first(100).each do |item|
      created_cosmetic = Cosmetic.create!(  # => I saved the new cosmetic created into the a varible to be used later on while creating reviews
      name: item["name"],
      description: item["description"].blank? ? "Test" : item["description"],  # Some of the itmes were not getting anything for the below field so i needed to add ternary operators
      brand: item["brand"].blank? ? "Test" : item["brand"],
      average_price: rand(1000...20000),
      category: item["product_type"].blank? ? "Test" : item["product_type"]
      # cosmetic_image: item["image_link"].blank? ? "Test" : item["image_link"]
      )
      image_link = item["image_link"].blank? ? "Test" : item["image_link"]
      begin
        image_uri = URI.open(image_link)
      rescue
        image_uri = URI.open(DEFAULT_IMAGE)
      end
      created_cosmetic.cosmetic_image.attach(io: image_uri, filename: "picture")
      # this was on master file, seems like we still need it
      created_cosmetic.tag_list = item["tag_list"]
      created_cosmetic.save
    end


      new_review = ["I’m not kidding, ever since I started using this serum I get complimented  MULTIPLE TIMES A WEEK. It really works. It’s definitely worth the price and I recommend it to everyone.", "Follow the instructions and you’ll be happy with the results. Holy grail!", "Absolutely Wonderful! This is one of the products I've ever used that does exactly what it claims. After 2 weeks I saw a noticeable difference in my skin.", "Absolutely love this product! I’ve been using it for 4 years now and it really helps with uneven skin tone and stretch marks. Smells like heaven too :)", "This product is amazing!  I use it as a replacement for foundation and it always looks great", "I had high hopes after seeing this product go viral, but I was disappointed.", "it feels really good on your skin. definitely recommend!", "Loved how my skin felt after using this product. The only negative thing I'd have to say, is that the scent of the product was not good at all.", "I purchased this product when my skin is going through a rough patch every now and again. It works great for small spots and large areas of the face.", "I like it. It’s not a miracle, but it’s good! It’s lasted me a while too.", "Super moisturizing and comfortable. One of my favourites, go buy!!", "Love love love! Use this every night before bed and would never go back.", "This product is great, super smooth and silky. But I feel like Aquaphor or Vaseline work just as good if not better.", "Love this! It’s so glowy and beautiful on the skin, I’m so glad I found this product. It’s been my go to, everyday since I got it!", "I love this stuff. Makes my skin look and feel amazing. Definitely my skin but better and last forever without be set."] # Just test reviews made for now. I can hard code some in
      new_shop_url = ["https://www.the-body-shop.co.jp/shop/","https://www.sephora.com/", "https://www.maccosmetics.jp/collections-ruby-woo-tokyo", "https://maison.kose.co.jp/site/awake/c/c01/", "https://online.naturesway.jp/"]

      # Can create a random number of reviews for products we saved above (only the product we just save)
# Create review for each cosmetic ()

#parsing the japanese json below and creating jp products for out db

  file = File.read("results.json")

  results_json = JSON.parse(file)

  results_json.first(50).each do |result|

    split_first_ingredient =
      if result["composition"].match(/】/)
        result["composition"].chomp.split("、")[0].split("】")[1]
      else
        result["composition"].chomp.split("、")[0].split("＞")[1]
      end
    rest_of_ingredient_list = result["composition"].chomp.split("、")[1..-1]
    full_ingredient_list = rest_of_ingredient_list << split_first_ingredient
    ingredients = []
    full_ingredient_list.each do |ingredient_jp|
      if Ingredient.find_by(name_jp: ingredient_jp).present?
        ingredients << Ingredient.find_by(name_jp: ingredient_jp)
      else
        name_en = DeepL.translate ingredient_jp, 'JA', 'EN'
        ingredients << Ingredient.create!(name_en: name_en.text.split(" (")[0], name_jp: ingredient_jp)
      end
    end

    japanese_cosme = Cosmetic.create!(
      name: DeepL.translate(result["product"], 'JA', 'EN'),
      category: "Skin care",
      description: "Skin care is the range of practices that support skin integrity, enhance its appearance and relieve skin conditions. They can include nutrition, avoidance of excessive sun exposure and appropriate use of emollients.",
      average_price: rand(1000...20000),
      brand: ["Seiko", "SKII", "Pelume", "Japan Labo"].sample
    )
    image_link = "https://www.matsukiyo.co.jp" + result["image_link"][1..-2]
    if image_link == "https://www.matsukiyo.co.jp"
      image_link = "Test"
    end
    begin
      image_uri = URI.open(image_link)
    rescue
      image_uri = URI.open(DEFAULT_IMAGE)
    end
    japanese_cosme.cosmetic_image.attach(io: image_uri, filename: "picture")
    japanese_cosme.ingredients << ingredients
    japanese_cosme.save
  end

  Cosmetic.all.each do |cosmetic|   ### Because this wasnt moved down the new cosmetics from the scrapped file were not in the loop and did not get any reviews
        5.times do
          Review.create!(cosmetic_id: cosmetic.id,
          user_id: user.id,
          content: new_review.sample,
          rating: rand(1..5),
          shop_url: new_shop_url.sample
          )
        end
      end

  puts "#{Cosmetic.count} cosmetics created!"

#.text.split(" (")[0] this will be added to line 138 when seed is working
