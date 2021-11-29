def stock_picker(price)
    #This determines how many prices there are inside the array
    indexprice = price.count.to_i
    
    #This create an array of a range between an initial value (1) and the index of prices previously defined(n)
    day =*(1..indexprice)
    
    #This creates a hash from the previous two varaibles, where day one is linked to price1, day two to p2, d3 to p3, ...
    hashprices = Hash[day.zip(price)]

    #For simplicity of reading, this prints the previous hash
    hashprices.each do |key, value|
        puts "Day #{key} stocks price was #{value}$"    
    end

    #Here we iterate along the hash to find the minimum value stored and then we print this value alongside it's key (the day)
    buyat = hashprices.group_by{|k, v| v}.min_by{|k, v| k}.last.to_h 
    buyat.each do |key, value|
        puts "You should buy stocks during day #{key} at the price of #{value}$"
    end
    
    #Same thing that the function above, but this time we find the maximum value (or the point where we would want to sell the stock)
    sellat = hashprices.group_by{|k, v| v}.max_by{|k, v| k}.last.to_h 
    sellat.each do |key, value|
        puts "You should sell stocks during day #{key} at the price of #{value}$"
    end


end

stock_picker([17,3,6,9,15,8,6,1,10])