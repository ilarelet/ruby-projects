def stock_picker(stocks)
    biggest_profit = 0
    best_buy_day = 0
    best_sell_day = 0
    buy_day = 0
    #To optimize the code efficiency up to O(N) instead of two loops (O(N^2) efficiency)
    #it makes one loop with a number of variables:
    stocks.each_index do |day|
        #if today's price is cheaper then the lowest we had before it's definitly 
        #the best buy_day for all sell_days we'll see in future 
        if stocks[day]<stocks[buy_day]
            buy_day=day
        #if the profit we'd make if we sold today is bigger than "biggest profit" - update all the variables 
        elsif (stocks[day]-stocks[buy_day]) > biggest_profit
            biggest_profit = stocks[day]-stocks[buy_day]
            best_buy_day = buy_day
            best_sell_day = day
        end
    end
    puts "Best day to buy is #{best_buy_day}, best day to sell is #{best_sell_day}"
    puts "Your profit would be #{biggest_profit}"
    #return an array of the best days to buy and sell
    [best_buy_day, best_sell_day]
end 

stocks = [17,3,6,9,15,8,6,1,10]
best_days = stock_picker(stocks)