#add colums to schema
#japanse to english
#use deepl translation API 水、グリセリン

#task seed_ingredient: :environment do
  #results_json = JSON.parse("results.json")
  #results_json.each do |result|
    #split_first_ingredient =
      #if result.composition("】").present?
       # result.composition.chomp.split("、")[0].split("】")[1]
      #else
      #  result.composition.chomp.split("、")[0].split("＞")[1]
     # end
    #rest_of_ingredient_list = result.composition.chomp.split("、")[1..-1]
    #full_ingredient_list = rest_of_ingredient_list << split_first_ingredient
    #full_ingredient_list.each do |ingredient_jp|
      #if Ingredient.find_by(name_jp: ingredient_jp).present?
       # next
      #else
     #   name_en = DeepL.translate (ingredient_jp, 'JA', 'EN').text
    #    Ingredient.create!(name_en: name_en, name_jp: ingredient_jp)
   #   end
  #  end
 # end

#end


#below is test block so as to not eat into character allowence for deepl translation API


desc "translates ingredients and adds them to an array "
task seed_ingredient: :environment do
  results_json = [  {
    "product": "旭研究所 業務用 ハイドロキノン １０ｇ ",
    "image_link": "'/medias/4589654980044-1.jpg?context=bWFzdGVyfGltYWdlc3wyNTcyOHxpbWFnZS9qcGVnfHN5cy1tYXN0ZXIvaW1hZ2VzL2g1ZC9oYjIvODk5OTU3MzUyMDQxNC80NTg5NjU0OTgwMDQ0XzEuanBnfDg0NTZiNTcyODY0ODE1NTBiMDhiNmQ0NTJmZTVjYzJlMmQ3MGU5NjY4OTVmMWY2YTgzYmQ2ZTUzNDU3NTk3OTM'",
    "price": "",
    "product_url": "https://www.matsukiyo.co.jp/store/online/p/4589654980044",
    "composition": "【成分】水、グリセリン、ハイドロキノン、フェノキシエタノール、クエン酸Ｎａ、ピロ亜硫酸Ｎａ、カラメル、クエン酸\n",
    "position": 1
  },
  {
    "product": "菊正宗酒造 日本酒の化粧水 高保湿 ５００ｍｌ ",
    "image_link": "'/medias/4971650800578-1.jpg?context=bWFzdGVyfGltYWdlc3wzNDA3NXxpbWFnZS9qcGVnfHN5cy1tYXN0ZXIvaW1hZ2VzL2hiMS9oNmUvODk5OTU2Nzc4NjAxNC80OTcxNjUwODAwNTc4XzEuanBnfDFmODAwMGZjNzE2MDYzNTdhM2JiMzNjNGEwMzAyYzNiODY0NGM5MzZiMTQ3ZDRhOThjZjNjNTY1MGEzMTYyYWQ'",
    "price": "",
    "product_url": "https://www.matsukiyo.co.jp/store/online/p/4971650800578",
    "composition": "＜配合成分＞水、グリセリン、BG、コメ発酵液、グルタミン酸、アルギニン、ロイシン、セラミド3、セラミド6II、プラセンタエキス、アルブチン、グリチルリチン酸2K、ダイズタンパク、他\n",
    "position": 2
  },
  {
    "product": "ロート製薬 オバジC 酵素洗顔パウダー ３０個 ",
    "image_link": "'/medias/4987241149445-1.jpg?context=bWFzdGVyfGltYWdlc3wyMjAyOXxpbWFnZS9qcGVnfHN5cy1tYXN0ZXIvaW1hZ2VzL2hjNi9oMmEvODk1OTEzNzY3NzM0Mi80OTg3MjQxMTQ5NDQ1XzEuanBnfGExYjc3MDE5OWVmZjBiYzY0ZTk3OTc2MTE0OWE4NGVhOTZiZDBlNWZjYWZiMTRhMTE3NmZlZGIzNjMzOWE1YzI'",
    "price": "",
    "product_url": "https://www.matsukiyo.co.jp/store/online/p/4987241149445",
    "composition": "【成分】タルク、ラウロイルグルタミン酸Ｎａ、ミリストイルグルタミン酸Ｎａ、ソルビトール、ココイルグリシンＮａ、アクリレーツクロスポリマー－２Ｎａ、アスコルビン酸、プロテアーゼ、リパーゼ、ヒメフウロエキス、アスコフィルムノドスムエキス、水、シリカ、デキストリン、ＢＧ、リン酸Ｋ、リン酸２Ｎａ、メチルパラベン\n",
    "position": 3
  },]
  results_json.each do |result|
    split_first_ingredient =
      if result[:composition].match(/】/)
        result[:composition].chomp.split("、")[0].split("】")[1]
      else
        result[:composition].chomp.split("、")[0].split("＞")[1]
      end
    rest_of_ingredient_list = result[:composition].chomp.split("、")[1..-1]
    full_ingredient_list = rest_of_ingredient_list << split_first_ingredient
    ingredients = []
    full_ingredient_list.each do |ingredient_jp|
      if Ingredient.find_by(name_jp: ingredient_jp).present?
        ingredients << Ingredient.find_by(name_jp: ingredient_jp)
      else
        #p name_en = DeepL.translate(ingredient_jp, 'JA', 'EN')
        name_en = call_deepl(ingredient_jp, i)
        ingredients << Ingredient.create!(name_en: name_en.text.split(" (")[0], name_jp: ingredient_jp)
      end
    end
    #new_cosme = Cosmetic.create!(name: DeepL.translate(result[:product], 'JA', 'EN'), cosmetic_image: result[:image_link][1..-2], category: "Skin care", description: "Skin care is the range of practices that support skin integrity, enhance its appearance and relieve skin conditions. They can include nutrition, avoidance of excessive sun exposure and appropriate use of emollients.", average_price: rand(1000...20000), brand: ["Seiko", "SKII", "Pelume", "Japan Labo"].sample )
    #new_cosme.ingredients << ingredients
  end

end

def call_deepl(ingredient, index)
  puts "there is an error in #{index}" if ingredient.blank?
  return if ingredient.blank?
  DeepL.translate(ingredient, 'JA', 'EN')
end


















#$ rails (rake) seed_ingredient
#  "description" => "#{DeepL.translate element.text.strip, 'JA', 'EN'}",
#r = "【成分】水、グリセリン、ハイドロキノン、フェノキシエタノール、クエン酸Ｎａ、ピロ亜硫酸Ｎａ、カラメル、クエン酸\n"
#r.chomp.split("、")
#r.chomp.split("、")[0]
#r.chomp.split("、")[0].split("】")
#r.chomp.split("、")[0].split("】")[1]

#a = "＜配合成分＞水、グリセリン、BG、コメ発酵液、グルタミン酸、アルギニン、ロイシン、セラミド3、セラミド6II、プラセンタエキス、アルブチン、グリチルリチン酸2K、ダイズタンパク、他\n"
#a.chomp.split("、")[0].split("＞")[1]
