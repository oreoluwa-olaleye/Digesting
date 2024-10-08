require 'nokogiri'
require 'date'

# Create a new XML document
builder = Nokogiri::XML::Builder.new do |xml|
  xml.urlset('xmlns' => 'http://www.sitemaps.org/schemas/sitemap-image/1.1') do
    
    # Homepage
    xml.url do
      xml.loc 'https://digest.i.ng/'
      xml.lastmod Date.today.strftime('%Y-%m-%d')
      xml.changefreq 'daily'
      xml.priority '1.0'
    end

    # News page
    xml.url do
      xml.loc 'https://digest.i.ng/news'
      xml.lastmod Date.today.strftime('%Y-%m-%d')
      xml.changefreq 'daily'
      xml.priority '0.8'
    end

    # Reports page
    xml.url do
      xml.loc 'https://digest.i.ng/reports'
      xml.lastmod Date.today.strftime('%Y-%m-%d')
      xml.changefreq 'weekly'
      xml.priority '0.8'
    end

    # Categories
    categories = ['entertainment', 'finance', 'technology', 'health', 'sports', 'politics']
    categories.each do |category|
      xml.url do
        xml.loc "https://digest.i.ng/categories/#{category}"
        xml.lastmod Date.today.strftime('%Y-%m-%d')
        xml.changefreq 'weekly'
        xml.priority '0.6'
      end
    end

    # Posts (assuming your posts are stored in _posts directory)
    posts = Dir.glob('_posts/*.{md,markdown}') # Adjust if you have a different structure
    posts.each do |post|
      title = File.basename(post, File.extname(post)).tr('_', '-')
      xml.url do
        xml.loc "https://digest.i.ng/posts/#{title}/"
        xml.lastmod File.mtime(post).strftime('%Y-%m-%d')
        xml.changefreq 'monthly'
        xml.priority '0.5'
      end
    end
  end
end

# Write the sitemap to a file
File.write('sitemap.xml', builder.to_xml)
