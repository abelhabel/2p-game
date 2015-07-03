class Player  
  def initialize(name, hp, score)  
    # Instance variables  
    @name = name 
    @hp = hp
    @score = score
  end  
  attr_accessor :name
  attr_accessor :score
  def reduce_hp!
    @hp -= 1
  end
  def get_hp
    @hp
  end
  def reset_hp!
    @hp = 3
  end
  def increase_score!
    @score += 1
  end

end 