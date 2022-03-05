require 'kimurai'

class MatukiyoSpider < Kimurai::Base
  @name = "matukiyo_spider"
  @engine = :selenium_firefox
  @start_urls = ["https://www.matsukiyo.co.jp/store/online/search?category=003317&sortOrder=FAVORITE"]
  @config = {
    user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36"
    }
  @cosmetics = []

  def parse(response, url:, data: {})
    count = response.xpath("//ul[@id='itemList']//p[@class='ttl']/a").count

    # unless browser.has_content?('もっと見る') == false
    #   browser.find("//p[@id='searchMore']").click ; sleep 2
    # end
    # response = browser.current_response
    loop do
      browser.find("//*[@id='searchMore']").click ; sleep 2
      response = browser.current_response
      new_count = response.xpath("//ul[@id='itemList']//p[@class='ttl']/a").count
      if count >= 100
        p "> Pagination is done" and break
      else
        count = new_count
        p "> Continue scrolling, current count is #{count}..."
      end
    end
    p response.xpath("//ul[@id='itemList']//p[@class='ttl']/a").count

    response.xpath("//ul[@id='itemList']//p[@class='ttl']/a").each do |a|
      request_to :parse_cosme_page, url: "https://www.matsukiyo.co.jp#{a[:href]}"

    end
  end

  def parse_cosme_page(response, url:, data: {})
    item = {}

    item[:product] = response.xpath("//div[@class='goodsBox']/h3").text
    # p item[:product]
    begin
      item[:image_link] = response.xpath("//li[@class='disp_image']//a").first.values.first[/url\((.+)\)/, 1]
  # do something that might cause an exception
    rescue
      item[:image_link] = ""
      # handle the exception here
    end
      # p item[:image_link]
    item[:price] = response.xpath("//p[@class='price']/span/span[0]").text
    # p item[:price]
    item[:product_url] = url
    # p item[:product_url]
    item[:composition] = response.xpath("//div[@class='inner']/p[1]").text.split("\t").grep(/水/).first
    # p item[:composition]
    item[:description] = response.xpath("//div[@class='goodsDetail']/div[@class='ctBox02']/p").text
    # p item[:description]
    item[:brand] = response.xpath("//div[@class='goodsBox']/p[@class='cpde']").text.split("\t").grep(/メーカー/).first.split("\n")
     # p item[:brand]
    save_to "results.json", item, format: :pretty_json, append: true
  end
end

#MatukiyoSpider.crawl!
