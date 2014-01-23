class DicegameController < ApplicationController

  # attr_accessor :goal

  # def initialize(initial_goal = 0)
  #   @goal = initial_goal
  # end

  # def deposit
  #   @goal= @goal
  # end

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
        @winlose = "Win"
    
      end 

      if @sum==2 or @sum==3 or @sum==12
        @winlose = "Lose"
      end 

    else
      #@goal = deposit(@sum)
      $goal = @sum
    end

    render "dicefirst"
  end

  def show_dice
    die =[1,2,3,4,5,6]
    number_of_dice = params["number"]

     if number_of_dice == nil
       number_of_dice = 2
     end

    @dice = die.sample(number_of_dice.to_i)

    @sum=@dice.sum


    if @sum != 7
      if @sum == $goal
        @winlose = "You win!"
      end

    else if @sum == 7
      @winlose = "You lose!"
    end

    end

    render "dice"
  end


end

