#add colums to schema
#japanse to english
#use deepl translation API 水、グリセリン

task seed_ingredient: :enviroment do
  results_json = JSON.parse("results.json")
  results_json.each do |result|
    split_first_ingredient =
      if result.composition("】").present?
        result.composition.chomp.split("、")[0].split("】")[1]
      else
        result.composition.chomp.split("、")[0].split("＞")[1]
      end
    rest_of_ingredient_list = result.composition.chomp.split("、")[1..-1]
    full_ingredient_list = rest_of_ingredient_list << split_first_ingredient
    full_ingredient_list.each do |ingredient_jp|
      if Ingredient.find_by(name_jp: ingredient_jp).present?
        next
      else
        name_en = DeepL.translate (ingredient_jp, 'JA', 'EN').text
        Ingredient.create!(name_en: name_en, name_jp: ingredient_jp)
      end
    end
  end

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
