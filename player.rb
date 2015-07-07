class Player  

  DEFAULT_HP = 3

  attr_reader :name, :score, :hp #reader

  def initialize(name, hp = DEFAULT_HP, score = 0)  
    # Instance variables  
    @name = name 
    @hp = hp
    @score = score #games_won
  end  

  def reduce_hp
    @hp -= 1
  end

  def reset_hp
    @hp = DEFAULT_HP
  end

  def increase_score
    @score += 1
  end



end 