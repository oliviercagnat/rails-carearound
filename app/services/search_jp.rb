class SearchJp
  require "nokogiri"
  require "open-uri"
  require "deepl"

  def self.search
    url = "https://www.matsukiyo.co.jp/store/online/search?category=00331703&sortOrder=POPULARITY"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    results = html_doc.search('#itemList .ttl')
    cosme = []
    item = {}
    results.first(5).each_with_index do |element, index|
      item = {
        "id:" => "#{index + 1}",
        "description:" => "#{DeepL.translate element.text.strip, 'JA', 'EN'}",
        "link:" => "#{element.children[0]['href']}"
      }
      cosme << item
    end
    cosme
  end
end


# "description:" => "#{DeepL.translate element.text.strip, 'JA', 'EN'}",
