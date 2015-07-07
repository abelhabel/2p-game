class InvalidGuessError

  def self.validate(value)
    raise TypeError, 'No numbers in string' if !(/\d+/.match(value))
  rescue 
    puts "Ivalid input! Only numbers please"
    false
  end

end
