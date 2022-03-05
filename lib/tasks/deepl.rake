task test_check: :environment do
  file = File.read("results.json")

  results_json = JSON.parse(file)
  puts "file_parsed"
  results_json.each.with_index do |result, i|
    puts i
    split_first_ingredient =
      if result["composition"].match(/】/)
        result["composition"].chomp.split("、")[0].split("】")[1]
      else
        result["composition"].chomp.split("、")[0].split("＞")[1]
      end
    rest_of_ingredient_list = result["composition"].chomp.split("、")[1..-1]
    full_ingredient_list = rest_of_ingredient_list << split_first_ingredient
    ingredients = []
    # full_ingredient_list.compact.each do |ingredient_jp|
    #   if Ingredient.find_by(name_jp: ingredient_jp).present?
    #     ingredients << Ingredient.find_by(name_jp: ingredient_jp)
    #   else
    #     name_en = DeepL.translate(ingredient_jp, 'JA', 'EN')
    #     ingredients << Ingredient.create!(name_en: name_en.text.split(" (")[0], name_jp: ingredient_jp)
    #   end
    # end

    # japanese_cosme = Cosmetic.create!
    #   name: ""#DeepL.translate(result["product"], 'JA', 'EN'),
    #   category: "Skin care",
    #   description: ""#DeepL.translate(result["description"], 'JA', 'EN'),
    #   average_price: rand(1000...20000),
    #   brand: "" # DeepL.translate(result["brand"], 'JA', 'EN')
    # )
    puts result["image_link"]
    image_link_ending = result["image_link"][1..-2]
    if image_link_ending
      image_link = "https://www.matsukiyo.co.jp" + image_link_ending
    else
      image_link = "Test"
    end
    # begin
    #   image_uri = URI.open(image_link)
    # rescue
    #   image_uri = URI.open(DEFAULT_IMAGE)
    #  end
    # japanese_cosme.cosmetic_image.attach(io: image_uri, filename: "picture")
    # japanese_cosme.ingredients << ingredients
    # japanese_cosme.save
  end
end


