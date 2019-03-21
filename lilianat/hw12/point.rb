require "pry"
require "rest-client"
require "nokogiri"

page = Nokogiri::HTML(RestClient.get('https://point.md/ru/').body)

keys    = page.css("div#post-list-container article div h2").text.split("\n\n")[0..9].map! {|s| s.lstrip}
links   = page.css("div#post-list-container figure img")[0..9].map { |sr| sr.attr("src")}
results = Hash[keys.zip links]

pp results

results.each do |keys, links| 
	File.open("#{keys}", "w") { |f| f.write(RestClient.get(links)) } 
end


