namespace :cron do
  desc "TODO"
  task generate_sitemap: :environment do
    GenerateSitemapJob.new.perform
  end

end
