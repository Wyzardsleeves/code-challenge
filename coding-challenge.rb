require 'nokogiri'

html = File.open("files/van-gogh-paintings.html")
parsed_data = Nokogiri::HTML.parse(html)

puts parsed_data.title
