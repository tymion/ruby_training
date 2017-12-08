#!/usr/bin/ruby -w

require 'open-uri'
require 'nokogiri'

url_base = "https://www.gpw.pl/"
url_arch = url_base + "archiwum-notowan?"

@html_doc = Nokogiri::HTML(open(url_arch))
#puts @html_doc
options = @html_doc.css('form#archiwum-notowan-search select#selectType option')
#puts options
#puts options.size
db = []
options.each {
    |option|
    type = option.css("@value")
#    puts GPWObject.new(option.content)
    puts option.css("@value")

}
#options = test.at_css "option#value"
#puts options
