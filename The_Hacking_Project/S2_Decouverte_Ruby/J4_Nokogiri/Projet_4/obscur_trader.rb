require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

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



# html.no-js body div.container div.row div.col-xs-12.col-sm-12.col-md-12.col-lg-10 div.row div.col-xs-12 div.table-responsive div#currencies-all_wrapper.dataTables_wrapper.no-footer table#currencies-all.table.js-summary-table.dataTable.no-footer tbody tr#id-bitcoin.odd td.no-wrap.text-right a.price
# html.no-js body div.container div.row div.col-xs-12.col-sm-12.col-md-12.col-lg-10 div.row div.col-xs-12 div.table-responsive div#currencies-all_wrapper.dataTables_wrapper.no-footer table#currencies-all.table.js-summary-table.dataTable.no-footer tbody tr#id-bitcoin.odd td.no-wrap.currency-name a
