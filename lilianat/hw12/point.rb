require "pry"
require "rest-client"
require "nokogiri"
require "pp"

data = RestClient.get('https://point.md/ru/').body
page = Nokogiri::HTML(data)

keys    = page.css("div#post-list-container article div h2").text.split("\n\n")[0..9].map! {|s| s.lstrip}
links   = page.css("div#post-list-container figure img")[0..9].map { |sr| sr.attr("src")}
results = Hash[keys.zip links]

pp results













