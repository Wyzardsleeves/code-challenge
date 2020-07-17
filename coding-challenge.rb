require 'nokogiri'

class FileParse
  def start
    array = []

    #get parsed data
    html = File.open("files/van-gogh-paintings.html")
    parsed_data = Nokogiri::HTML.parse(html).css(".mlo-c")

    #asort into array
    parsed_data.each do |item|
      array.push({
        name: item.css(".kltat").css("span").text,
        extensions: ext_arr(item.css(".ellip")),
        link: item.at_css(".klitem")["href"],
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
