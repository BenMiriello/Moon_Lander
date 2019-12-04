# require_relative 'Play_Moon_Lander'

def intro

system 'clear'

puts "\n\n\n\nYou are about to land on the moon. This is your trusty craft: * /O\\ *  Wow!\n\n"

puts "Each turn is one second of your descent.\n\n"
puts "Your craft is stationary at the start, but each turn gravity will accelerate it downward.\n\n"
puts "Move to the next turn by hitting \'return\'.\n\n"
puts "To survive, you must slow your descent to 1 m/s at the surface.\n\n"
puts "You have thrusters that will slow you down, but only so many units of fuel,\n\n"  # Get it to say the actual units of fuel tho
puts "and your thrusters can only change your velocity by up to 3 m/s per turn.\n\n"
puts "Thrust by typing a number from 1 to 3 before hitting \'return\'\n\n"
puts "Hit ENTER to play.\n\n\n\n\n\n\n\n"
input = gets
# puts "Good luck!\n\n\n"
# sleep(2)
# puts "3...\n\n\n"
# sleep(1)
# puts "2...\n\n\n"
# sleep(1)
# puts "1...\n\n\n"
# sleep(1)

end

