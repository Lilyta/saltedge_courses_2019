require 'watir'
require 'nokogiri'
require 'pry'

browser = Watir::Browser.new
browser.goto("kinopoisk.ru")

movies = ["Bohemian Rhapsody", "Interstellar", "John Wick"]

favorites = []

movies.each do |x|
	browser.text_field.to_subtype.set(x)
	browser.div(class: "header-fresh-search-suggest-partial-component__group_type_first").click

	page = Nokogiri::HTML.parse(browser.html)

	movie = {}
	movie[:name]        = page.css("h1").text 
	movie[:year]        = page.css("tr")[0].css("td")[1].css("a").text 
	movie[:country]     = page.css("tr")[1].css("td")[1].css("div").text.lstrip.rstrip 
	movie[:director]    = page.css("tr")[3].css("td")[1].css("a").text 
	movie[:genre]       = page.css("tr")[10].css("td")[1].css("span").text 
	movie[:main_actors] = page.css("div#actorList ul").css("li")[0..4].map {|a| a.text}
	favorites << movie

end

pp favorites

=begin
[{:name=>"Богемская рапсодия",
  :year=>"2018",
  :country=>"Великобритания, США",
  :director=>"Брайан Сингер",
  :genre=>"драма, биография, музыка",
  :main_actors=>
   ["Рами Малек",
    "Люси Бойнтон",
    "Гвилим Ли",
    "Бен Харди",
    "Джозеф Маццелло"]},
 {:name=>"Интерстеллар",
  :year=>"2014",
  :country=>"США, Великобритания",
  :director=>"Кристофер Нолан",
  :genre=>"фантастика, драма, приключения",
  :main_actors=>
   ["Мэттью МакКонахи",
    "Энн Хэтэуэй",
    "Джессика Честейн",
    "Маккензи Фой",
    "Майкл Кейн"]},
 {:name=>"Джон Уик",
  :year=>"2014",
  :country=>"Китай, США",
  :director=>"Чад СтахелскиДэвид Литч",
  :genre=>"боевик, триллер, криминал",
  :main_actors=>
   ["Киану Ривз",
    "Микаэл Нюквист",
    "Алфи Аллен",
    "Уиллем Дефо",
    "Дин Уинтерс"]}]
=end

