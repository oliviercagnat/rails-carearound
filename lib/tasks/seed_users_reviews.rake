task seed_users_reviews: :environment do


  new_review = ["I’m not kidding, ever since I started using this serum I get complimented  MULTIPLE TIMES A WEEK. It really works. It’s definitely worth the price and I recommend it to everyone.", "Follow the instructions and you’ll be happy with the results. Holy grail!", "Absolutely Wonderful! This is one of the products I've ever used that does exactly what it claims. After 2 weeks I saw a noticeable difference in my skin.", "Absolutely love this product! I’ve been using it for 4 years now and it really helps with uneven skin tone and stretch marks. Smells like heaven too :)", "This product is amazing!  I use it as a replacement for foundation and it always looks great", "I had high hopes after seeing this product go viral, but I was disappointed.", "it feels really good on your skin. definitely recommend!", "Loved how my skin felt after using this product. The only negative thing I'd have to say, is that the scent of the product was not good at all.", "I purchased this product when my skin is going through a rough patch every now and again. It works great for small spots and large areas of the face.", "I like it. It’s not a miracle, but it’s good! It’s lasted me a while too.", "Super moisturizing and comfortable. One of my favourites, go buy!!", "Love love love! Use this every night before bed and would never go back.", "This product is great, super smooth and silky. But I feel like Aquaphor or Vaseline work just as good if not better.", "Love this! It’s so glowy and beautiful on the skin, I’m so glad I found this product. It’s been my go to, everyday since I got it!", "I love this stuff. Makes my skin look and feel amazing. Definitely my skin but better and last forever without be set."] # Just test reviews made for now. I can hard code some in
  new_shop_url = ["https://www.the-body-shop.co.jp/shop/","https://www.sephora.com/", "https://www.maccosmetics.jp/collections-ruby-woo-tokyo", "https://maison.kose.co.jp/site/awake/c/c01/", "https://online.naturesway.jp/"]

  user1 = User.create!(
    email: "careuser1@gmail.com",
    password: "12345678@Aa",
    name: "Gabrielle Solis",
    skin_type: "Oily",
    country: "US",
  )
  puts "User #{user1.name} created!"

  Cosmetic.all.each do |cosmetic|
    Review.create!(cosmetic_id: cosmetic.id,
          user_id: user1.id,
          content: new_review.sample,
          rating: rand(1..5),
          shop_url: new_shop_url.sample
          )
  end
  puts "Reviews of #{user1.name} created!"


  user2 = User.create!(
    email: "careuser2@gmail.com",
    password: "12345678@Aa",
    name: "Christine Boutin",
    skin_type: "Sensitive",
    country: "France",
  )
  puts "User #{user2.name} created!"

  Cosmetic.all.each do |cosmetic|
    Review.create!(cosmetic_id: cosmetic.id,
          user_id: user2.id,
          content: new_review.sample,
          rating: rand(1..5),
          shop_url: new_shop_url.sample
          )
  end
  puts "Reviews of #{user2.name} created!"

  user3 = User.create!(
    email: "careuser3@gmail.com",
    password: "12345678@Aa",
    name: "Naomi Campbell",
    skin_type: "Normal",
    country: "UK",
  )
  puts "User #{user3.name} created!"

  Cosmetic.all.each do |cosmetic|
    Review.create!(cosmetic_id: cosmetic.id,
          user_id: user3.id,
          content: new_review.sample,
          rating: rand(1..5),
          shop_url: new_shop_url.sample
          )
  end
  puts "Reviews of #{user3.name} created!"

  user4 = User.create!(
    email: "careuser4@gmail.com",
    password: "12345678@Aa",
    name: "France Gall",
    skin_type: "Dry and fair",
    country: "FR",
    # avatar: "https://kitt.lewagon.com/placeholder/users/arthur-littm"
  )
  puts "User #{user4.name} created!"

  Cosmetic.all.each do |cosmetic|
    Review.create!(cosmetic_id: cosmetic.id,
          user_id: user4.id,
          content: new_review.sample,
          rating: rand(1..5),
          shop_url: new_shop_url.sample
          )
  end
  puts "Reviews of #{user4.name} created!"

end
