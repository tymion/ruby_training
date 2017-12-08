#!/usr/bin/ruby -w

class Customer
    @@no_of_customers = 0
    def initialize(id, name, addr)
        @cust_id = id
        @cust_name = name
        @cust_addr = addr
        @@no_of_customers += 1
    end
    def getCustomersCnt
        puts "Customers count is: #@@no_of_customers"
    end
    def self.getCustomersCnt
        puts "Customers count is: #@@no_of_customers"
    end
end

cust = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2 = Customer. new("2", "Poul", "New Emire road, Khandala")
if cust == nil then
    puts "cust jest nil"
end
if cust == cust2 then
    puts "Te same"
else
    puts "Rozne"
end
Customer.getCustomersCnt
cust.getCustomersCnt
