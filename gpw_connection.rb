#!/usr/bin/ruby -w

require 'open-uri'
require 'nokogiri'

class GPWConnection
    @@url_base = "https://www.gpw.pl/"
    @@url_arch = @@url_base + "archiwum-notowan?"
    @@html_doc = Nokogiri::HTML(open(@@url_arch))
    @@categories = nil
    def getTypeCategories
        if @@categories.nil? then
            @@categories = Hash.new
            options = @@html_doc.css('form#archiwum-notowan-search select#selectType option')
            options.each {
                |option|
                next if option.css("@value").to_s.empty?
                @@categories[option.css("@value").to_s] = option.content
#                puts option.css("@value").to_s + ":" + option.content
            }
        end
        return @@categories
    end
end
