module Myenumerables
    class Myeach
        def initialize(my_array)
            @my_array = my_array
        end
        def my_each
            x = 0
            while x < @my_array.length
                yield @my_array[x]
                x += 1
            end
        end
    end
end

test_arr = Myenumerables::Myeach.new(['a', 'b', 'c'])
test_arr.my_each {|x| puts x}
