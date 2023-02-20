def substring_count(inp_string, dictionary)
    #Making the search case insensitive
    string = inp_string.downcase
    dictionary.reduce(Hash.new(0)) do |count_hash, word|
        #Count how many instances of the possible substring are present in the input
        count_hash[word] = string.scan(word.downcase).length
        #returning the final result
        count_hash               
    end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts 'Enter your string: '
inp_string = gets.chomp
puts substring_count(inp_string, dictionary)