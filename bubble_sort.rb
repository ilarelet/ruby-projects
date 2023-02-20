def bubble_sort(array)
    sorted = false
    until sorted
        #we assume the array sorted
        sorted = true
        array.each_index do |index|
            if array[index+1] and array[index]>array[index+1]
                temp = array[index+1]
                array[index+1] = array[index]
                array[index] = temp
                #if there's at least one case of two items being not in order
                #the array is assumes not sorted, so the loop will run once again
                sorted=false
            end
        end
    end
    array
end


array = [4,3,78,2,0,2]
puts bubble_sort(array)