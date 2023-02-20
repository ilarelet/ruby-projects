def stock_picker(stocks)
    biggest_profit = 0
    stocks.each_index do |day_buy|
        day_sell = day_buy+1
        while stocks[day_sell] 
            if (stocks[day_sell] - stocks[day_buy]) > biggest_profit
                biggest_profit = stocks[day_sell] - stocks[day_buy]
                best_day_buy = day_buy
                best_day_sell = day_sell
            end
            day_sell+=1
        end
        puts [best_day_buy, best_day_sell]
    end
end

stocks = [17,3,6,9,15,8,6,1,10]
best_days = stock_picker(stocks)
puts = "Best day to buy is  #{best_days[0]}, best day to sell is #{best_days[1]}"