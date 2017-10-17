require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


# class incubateur
# end

def incubateurs
    page = Nokogiri::HTML(open("http://blog.neocamino.com/liste-des-incubateurs-a-paris/"))
    list_incu= page.css('h2+p')#.css('img[title="Liste des incubateurs à Paris"]')
    puts list_incu.count

    list_incu2 = list_incu.css('* img')
    puts list_incu2.count
i=0
    list_incu2.each do |incubateur|
      puts incubateur['src'] #alt title
      puts list_incu2[i]
      i+=1
# puts name_incu
# puts code_incu
# puts link_incu
# /html/body/section/article/div/div[1]/p[21]/strong
# div p
      # puts incubateur['title'='Liste des incubateurs à Paris']
    end
      # div p img.size-full.wp-image-2123.alignleft
      # div p a img.wp-image-2122.alignleft
      # div p a img.wp-image-2120.alignleft
      # div h2
end
# html.no-js body.single.single-post.postid-2090.single-format-standard section#river article#2090.post div.entry-content div p a img.wp-image-2119.alignleft
incubateurs


=begin
loop{
      page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

      currency_name  = page.css('td.no-wrap.currency-name a')
      currency_price = page.css('a.price')

      nbr = currency_name.count if currency_name.count == currency_price.count
      virtual_currency=Hash.new { |hash, key| hash[key] =  "not defined" }
      i=0

      currency_name.each { |c_name|  virtual_currency[c_name.content] = currency_price[i].text;  i+=1 }
      virtual_currency.each {|key, value| puts "#{key} \t is \t #{value}" }
      sleep(3600)
      puts "\n\nMAJ"
    }

# puts "\n"
# puts currency_price.count
# puts nbr
# puts virtual_currency.count
=end
