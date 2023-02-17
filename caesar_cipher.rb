def cipher(string,shift_by)
    array = string.split("") #Creating an array of charaters
    ciphered = array.map do |letter|
        original_index = letter.ord #get an ASCII code of a letter
        if original_index in (65..90) or original_index in (97..122) #if a character is a letter
            new_index = (original_index + shift_by) #update the index and return a ciphered letter
            #if new index is out of the alphabet range we must return back to beginning from 'z' to 'a'
            #With a large shift index uppercase letters might get into the lowercase interval after updating
            #The condition second prevents it
            if new_index > 122 or (new_index > 90 and letter.upcase == letter) 
                new_index -= 26
            end
            ciphered_letter = new_index.chr 
        else letter #if a character is not a letter - leave it unchanged
        end
    end
    ciphered.join #make up a string from the updated array
end

puts "Enter your string: "
original_string = gets.chomp
puts "Enter the shift index: "
shift_by = gets.chomp.to_i
puts cipher(original_string,shift_by) 