#!/usr/bin/ruby -w

require_relative 'gpw_connection'

gpw_conn = GPWConnection. new
options = gpw_conn.getTypeCategories
#db = []
options.keys.each {
    |option|
#    puts GPWObject.new(option.content)
    puts option + ":" + options[option]

}
