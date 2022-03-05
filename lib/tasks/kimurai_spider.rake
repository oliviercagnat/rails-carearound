task japanese_results: :environment do
  MatukiyoSpider.crawl!
end
