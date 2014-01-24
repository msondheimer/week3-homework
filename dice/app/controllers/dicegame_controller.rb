class DicegameController < ApplicationController

  def show_title
    render "directions"
  end

  def show_dice_first
    die =[1,2,3,4,5,6]
    number_of_dice = params["number"]

     if number_of_dice == nil
       number_of_dice = 2
     end

    @dice = die.sample(number_of_dice.to_i)

    @sum=@dice.sum

    if @sum==7 or @sum==11 or @sum==2 or @sum==3 or @sum==12
      if @sum==7 or @sum==11
        @winlose = "You win!"
    
      end 

      if @sum==2 or @sum==3 or @sum==12
        @winlose = "You lose!"
      end 

    else
      $goal = @sum
    end

   # render "dicefirst"
      if @winlose=="You win!" or @winlose =="You lose!"
        render "dicewinlose"
      else
        render "dicefirst"
      end


  end

  def show_dice
    #die =[1,2,3,4,5,6]
    die =[rand(1..6), rand(1..6), rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    number_of_dice = params["number"]

    if number_of_dice == nil
       number_of_dice = 2
    end

    @dice = die.sample(number_of_dice.to_i)

    @sum=@dice.sum


    if @sum != 7
      if @sum==$goal
        @winlose = "You win!"
    else
      @winlose = "You lose!"
    end
  end


    if @winlose=="You win!" or @winlose =="You lose!"
      render "dicewinlose"
    else
      render "dice"
    end
  end
end
