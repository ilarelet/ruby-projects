def substring_count(inp_string, dictionary)
    #Creating an array of strings out of the input
    strings = inp_string.downcase.split(" ")

    #Creating a hash to store the final result
    count_hash = Hash.new(0)
    dictionary.each do |word| 
        #checking each of words in the iputted string
        strings.each do |string|
            #Making sure the possible substring we are testing has no quotation marks and is downcase
            stripped_word = word.gsub("\"","").downcase
            if string.include?(stripped_word) 
                #if the possible substring IS and actual substring of our string - add it to the hash
                count_hash[stripped_word] +=1
            end
        end
    end 
    #returning the final result
    count_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts 'Enter your string: '
inp_string = gets.chomp
puts substring_count(inp_string, dictionary)