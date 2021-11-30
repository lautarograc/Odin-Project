module Myenumerables
    class Myselect
        def initialize(my_array)
            @my_array = my_array
        end

        def my_select
            x = 0
            while x < @my_array.length
                if x == true
                    yield @my_array[x]
                    x += 1
                end
            end
        end
    end
end
test_arr = Myenumerables::Myselect.new(['a', 'b', '3'])
puts test_arr.my_select{|x| x.even?}