class SearchJp
  require "nokogiri"
  require "open-uri"

  def self.search
    url = "https://www.matsukiyo.co.jp/store/online/search?category=00331703"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    results = html_doc.search('#itemList .ttl')
    cosme = {}
    results.each do |element|
      p element.text.strip
    end

  end
end
