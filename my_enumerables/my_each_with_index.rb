module Myenumerables
    class Myeachwithindex
        def initialize(my_array)
            @my_array = my_array
        end
        def my_each_with_index
             i = 0
             while i < @my_array.length
                yield [@my_array[i], i]
                 i += 1
             end
            end
        end
end

test_arr = Myenumerables::Myeachwithindex.new(['a', 'b', 'c'])
test_arr.my_each_with_index {|x, i| puts "#{x}#{i}"}
