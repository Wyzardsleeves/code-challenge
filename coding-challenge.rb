require 'nokogiri'

class FileParse
  def start
    html = File.open("files/van-gogh-paintings.html")
    parsed_data = Nokogiri::HTML.parse(html)

    puts parsed_data.title
  end
end

fileParse = FileParse.new
fileParse.start
