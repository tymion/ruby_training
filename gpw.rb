#!/usr/bin/ruby -w

require_relative 'gpw_connection'
require_relative 'gpw_object'

gpw_conn = GPWConnection. new
options = gpw_conn.getTypeCategories
db = []
options.keys.each {
    |option|
#    puts GPWObject.new(option.content)
#    puts option + ":" + options[option]
    object = GPWObject.new(option, options[option])
    gpw_conn.getInstruments(object, "PL")
    db.push(object)
}

=begin
db.each {
    |object|
    puts "==== TypeName: " + object.getTypeName + " ===="
    puts "==== Instruments: ===="
    instruments = object.getInstruments
    next if instruments.nil?
    instruments.keys.each {
        |instrument|
        puts "== " + instrument
    }
}
=end
puts "===="
object = db.at(0)
instruments = object.getInstruments
instrument = instruments.keys[0]
data = gpw_conn.getData(object.getType, instrument, "05-12-2017")
