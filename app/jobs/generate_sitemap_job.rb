class GenerateSitemapJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    SitemapGenerator::Sitemap.default_host = 'http://example.com'
    SitemapGenerator::Sitemap.create(:include_root => true) do
      puts "page count: "
      puts Page.published.count
      Page.published.each do |page|
        puts page.get_url
        add page.get_url, :changefreq => 'weekly'
      end
    end
  end

end
