def cipher(string,shift_by)
    array = string.split("") #Creating an array of charaters
    ciphered = array.map do |letter|
        original_index = letter.ord
        if original_index in (65..90) or original_index in (97..122) #if a character is a letter
            ciphered_letter = (original_index + shift_by).chr #update the index and return a ciphered letter
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