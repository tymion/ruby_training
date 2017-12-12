#!/usr/bin/ruby -w

class GPWObject
    def initialize(type, typeName)
        @type = type
        @typeName = typeName
        @instruments = nil
    end
    def getType
        return @type
    end
    def getTypeName
        return @typeName
    end
    def addInstrument(instrument, instrumentName)
        if @instruments.nil? then
            @instruments = Hash.new
        end
        @instruments[instrument] = instrumentName
    end
    def getInstruments
        return @instruments
    end
end
