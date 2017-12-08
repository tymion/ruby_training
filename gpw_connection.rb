#!/usr/bin/ruby -w

require 'open-uri'
require 'nokogiri'


#puts @html_doc
options = @html_doc.css('form#archiwum-notowan-search select#selectType option')
#puts options
#puts options.size
#options = test.at_css "option#value"
#puts options

class GPWConnection
    def initialize(url)
        @url_base = url
        @url_arch = url_base + "archiwum-notowan?"
        @html_doc = Nokogiri::HTML(open(url_arch))
    end
    def getTypeCategories
        options = @html_doc.css('form#archiwum-notowan-search select#selectType option')


end
