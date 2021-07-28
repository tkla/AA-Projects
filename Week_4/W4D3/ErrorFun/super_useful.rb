class CoffeeError < StandardError

end 

# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    if maybe_fruit == 'coffee' 
      raise CoffeeError.new("Try again, thanks for coffee") 
    else 
      raise ArgumentError.new("No")
    end
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin 
  maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e 
    puts e.message
    retry
  rescue ArgumentError => e
    puts e.message
  end

end  
class FriendError < StandardError 
end 

class ErrorName < StandardError
end 

class FavPastTimeError < StandardError
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise ErrorName.new("Name?") if @name.length == 0 
    @yrs_known = yrs_known
    raise FriendError.new("Less than 5 years?") if @yrs_known < 5
    @fav_pastime = fav_pastime
    raise FavPastTimeError.new("Past time?") if @fav_pastime.length == 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


