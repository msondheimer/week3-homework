class DicegamefirstrollController < ApplicationController
  def show_dice1
    die =[1,2,3,4,5,6]
    number_of_dice = params["number"]

     if number_of_dice == nil
       number_of_dice = 2
     end

    @dice = die.sample(number_of_dice.to_i)

    @sum=@dice.sum

    if @sum==7 or @sum==11 or @sum==2 or @sum==3 or @sum==12
      if @sum==7 or @sum==11
        @winlose = "Win"
    
      end 

      if @sum==2 or @sum==3 or @sum==12
        @winlose = "Lose"
      end 

    else
      @goal = @sum
    end

    render "dicefirst"
  end
end
