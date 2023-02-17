def cipher_letter(letter, shift_by, hash)
    original_index = hash[letter].to_i
    unless original_index + shift_by >= 26
        hash.key(original_index + shift_by)
    else
        hash.key(original_index + shift_by-26)
    end
end

def cipher(string,shift_by)
    lower_array=("a".."z").to_a
    letter_hash = Hash.new
    lower_array.each_index{|index| letter_hash[lower_array[index]]=index}

    array = string.split("")
    ciphered = array.map do |letter|
        if lower_array.include?(letter.downcase) 
            if letter.upcase == letter
                cipher_letter(letter.downcase, shift_by, letter_hash).upcase
            else
                cipher_letter(letter, shift_by, letter_hash)
            end
        else letter
        end
    end
    ciphered.join
end

puts "Enter your string: "
original_string = gets.chomp
puts "Enter the shift index: "
shift_by = gets.chomp.to_i
puts cipher(original_string,shift_by) 