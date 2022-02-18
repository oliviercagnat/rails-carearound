class SearchJp
  require "nokogiri"
  require "open-uri"

  def self.search
    url = "https://www.matsukiyo.co.jp/store/online/search?category=00331703"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    results = html_doc.search('#itemList .ttl')
    cosme = []
    item = {}
    results.each_with_index do |element, index|
      item = {
        "id:" => "#{index + 1}",
        "description:" => "#{element.text.strip}",
        "link:" => "#{element.children[0]['href']}"
      }
      cosme << item
    end
    cosme
  end
end

# product = html_doc.search('#itemList .ttl')
#     product_info = product.text.strip
#     link = product.children[0]['href']