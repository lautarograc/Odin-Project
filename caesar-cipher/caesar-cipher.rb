def translate(text, key)
    alphabet = ('a'..'z').to_a #include every downcase letter into an array
    output = "" #generate an output variable to include the translated message
    text = text.downcase #downcase user input
    text.each_char do |letter| #iterate over characters
        if letter == " "
            output += " "
        else
            find_letter = alphabet.find_index(letter) #iterate over alphabet to assign numeric value to letters
            translate_letter = ( find_letter + key ) % alphabet.count #shift over the required cypher key to translate the message and loop around Z>A<Z using the module
            output += alphabet[translate_letter] #form the encripted message            
        end
    end

    return output
end

translate("abc ABC", 2)

#note: this script doesn't work with any symbol that isn't an english alphabet letter, and it also returns every message in lower case)
