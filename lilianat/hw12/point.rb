require "pry"
require "rest-client"
require "open-uri"
require "nokogiri"
require "pp"

data = RestClient.get('https://point.md/ru/').body
page = Nokogiri::HTML(data)

keys    = page.css("div#post-list-container article div h2").text.split("\n\n")[0..9].map! {|s| s.lstrip}
links   = page.css("div#post-list-container figure img")[0..9].map { |sr| sr.attr("src")}
binding.pry
results = Hash[keys.zip links]

pp results

=begindef download (url, dest)
  open(url) do |u|
    File.open(dest, 'wb') { |f| f.write(u.read) }
    https://cobwwweb.com/download-collection-of-images-from-url-using-ruby
  end
end
=end


results.each do |keys, links| 
	open(links) do |u|
		keys.each do
			File.open(name, "wb") { |f| f.write(u.read) }
		end
	end
end

