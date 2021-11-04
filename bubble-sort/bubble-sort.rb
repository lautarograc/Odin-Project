def bubble_sort(sarr)
    n = sarr.length
    loop do
        sort = false
        (n-1).times do |i|
            if sarr[i] > sarr[i+1]
                sarr[i], sarr[i+1] = sarr[i+1], sarr[i]
                sort = true
            end
        end
        break if not sort
    end
    puts "#{sarr}"s
end



sarr = [1, 6, 3, 33, 2, 325, 564, 4, 3, 544]
bubble_sort(sarr)