require 'nokogiri'

class FileParse
  def start
    array = []

    #get parsed data
    # html = File.open("files/leonardo-da-vinci-paintings.html")
    #html = File.open("files/van-gogh-paintings.html")
    html = File.open("files/michelangelo-paintings.html")
    parsed_data = Nokogiri::HTML.parse(html).css(".EDblX").css("a")

    #asort into array
    parsed_data.each do |item|
      array.push({
        name: item.css("span").text,
        extensions: ext_arr(item.css(".ellip")),
        link: item["href"],
        image: item.at_css("img")["data-src"]
      })
    end

    puts array
  end

  #helper method for parsing multiple extensions in case another is found with the same className
  def ext_arr(ext)
    temp_arr = []
    ext.each{|e| temp_arr.push(e.text) }
    return temp_arr
  end
end

fileParse = FileParse.new
fileParse.start
