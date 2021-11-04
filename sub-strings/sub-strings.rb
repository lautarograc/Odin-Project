def substrings(words, dictionary)
    output = Hash.new(0)
    words = words.downcase

    dictionary.each do |word|
        finds = words.scan(word).length
        output[word] = finds unless finds == 0
    end
    return output
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("belowdowngomanteca", dictionary)