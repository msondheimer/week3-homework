class DicegameController < ApplicationController

  def show_title
    render "directions"
  end

  def show_dice_first
    die =[rand(1..6), rand(1..6), rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    number_of_dice = params["number"]

     if number_of_dice == nil
       number_of_dice = 2
     end

    @dice = die.sample(number_of_dice.to_i)

    @sum=@dice.sum

    if @sum==7 or @sum==11 or @sum==2 or @sum==3 or @sum==12
      if @sum==7 or @sum==11
        @winlose = "YOU WIN!"
    
      end 

      if @sum==2 or @sum==3 or @sum==12
        @winlose = "YOU LOSE."
      end 

    else
      @goal = @sum
    end

      if @winlose=="YOU WIN!" or @winlose =="YOU LOSE."
        render "dicewinlose"
      else
        render "dicefirst"
      end


  end

  def show_dice
    
    die =[rand(1..6), rand(1..6), rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    
    @dice = die.sample(2.to_i)

    @sum=@dice.sum

   
    @goal =  params['goal'].to_i

    if @sum != 7
      if @sum==@goal
        @winlose = "YOU WIN!"
      end
    else if @sum==7
      @winlose = "YOU LOSE."
    end
  end


    if @winlose=="YOU WIN!" or @winlose =="YOU LOSE."
      render "dicewinlose"
    else
      render "dice"
    end
  end
end
