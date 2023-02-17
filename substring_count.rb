def substring_count(string, dictionary)
    #dict_list = dictionary.split(",")
    new_string = string.gsub("\"","")
    dictionary.each do |word| 
        stripped_word = word.gsub("\"","")
        if new_string.include?(stripped_word) 
            puts stripped_word
        end

    end 
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substring_count('below', dictionary)