#!/usr/bin/ruby -w

require 'open-uri'
require 'nokogiri'

class GPWConnection
    @@url_base = "https://www.gpw.pl/"
    @@url_arch = @@url_base + "archiwum-notowan?"
    @@url_arch_full = @@url_base + "archiwum-notowan-full?"
    @@ajax_url =  @@url_base + "ajaxindex.php?"
    @@html_doc = Nokogiri::HTML(open(@@url_arch))
    @categories = nil
    def initialize
        @categories = Hash.new
        options = @@html_doc.css('form#archiwum-notowan-search select#selectType option')
        options.each {
            |option|
            next if option.css("@value").to_s.empty?
            @categories[option.css("@value").to_s] = option.content
#            puts option.css("@value").to_s + ":" + option.content
        }
    end

    def getTypeCategories
        return @categories
    end
    def getInstruments(gpw_object, lang)
        if gpw_object.nil? then
             raise ArgumentError, "Invalid parameter. 'gpw_object' can't be nil"
        end
        instruments_url = @@ajax_url + "action=GPWQuotationsArchive&start=ajaxInstrument&type=" + gpw_object.getType
        if lang then
            instruments_url += "&lang=" + lang
        end
        request = Nokogiri::HTML(open(instruments_url))
        request.css("option").each {
            |option|
            next if option.css("@value").to_s.empty?
            gpw_object.addInstrument(option.css("@value").to_s, option.content)
        }
    end
    def getData(type, instrument, date)
        if type.nil? or instrument.nil? then
             raise ArgumentError, "Invalid parameter. 'type' or 'instrument' can't be nil"
        end
        data_url = @@url_arch_full + "type=" + type + "&instrument=" + instrument
        if date then
            data_url += "&date=" + date
        end
        request = Nokogiri::HTML(open(data_url))
        puts request.css('table[class="table footable"] tr td')
    end
end
