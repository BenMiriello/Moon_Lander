require 'pry'
require_relative 'intro'
require_relative 'make_board'

def prelim_make_board(height)
  board = ['             *                *                             *   ']
  height.times { board << ' '} # add random stars by adding one * and a random amount of spaces in a random set of tiles
  # fuel = 0
  # delta_v = 0
  board << ' '
end

def run
  height = 31                             # Set starting parameters
  position = 1
  turns = 100
  fuel = 20
  delta_v = 0
  gravity = 1
  width = 80
  board = prelim_make_board(height)

  intro

  victory_lander = "                                      ! * /O\\ * !"
  defeat_lander = "                                        _ _\\/_   "

  # # # # # # # # # # # # # # #           # Generate random stars

  h = height # (height) # get actual hight next
  c = [rand(h)]
  12.times { c << rand(h) }
  s = [rand(width)]
  12.times { s << rand(width)}
  
  # turns.times do
  turn_bool = true
  input = nil

  turns.times do
    # while turn_bool == true
    if position >= height                 # First check: Are we at the ground yet?
      if delta_v > 1
        make_board(board, height, fuel, plus_minus = '  ', delta_v = 0, position = height, defeat_lander, h, c, s)
        puts "\n\nYou crashed! Say hello to the ground!\n\n\n" # Victory Board display here
      else
        make_board(board, height, fuel, plus_minus = '  ', delta_v = 0, position = height, victory_lander, h, c, s)
        puts "\n\n\nYou landed safely! Say hello to the ground!\n\n\n" # Defeat board display here
      end
      break

    else
      # board[position -1] = lander_top   # Reminder to make lander bigger.
      # board[position] = lander_bottom

      plus_minus = '↓-'                   # Generate telemetry panel
      if delta_v == 0
        plus_minus = '  '
      elsif delta_v > 0
        plus_minus = '↓-'
      else
        plus_minus = '↑+'
      end
      
      if fuel < 0
        fuel = 0
      end

      # # # # # # # # # # # # # # #       # Now make the board
      
      make_board(board, height, fuel, plus_minus, delta_v, position, h, c, s,)

      # # # # # # # # # # # # # # #       # Prepare for Next Turn

      # def the_time(input)               # new incomplete user input w/ timer method is here .......
      #   timer = Time.now.sec
      #   while Time.now.sec == timer
      #     input = gets.chomp.to_i
      #     if r
      #       input = r
      #     end
      #   end
      #   input
      # end

      # the_time(input)

      input = gets.chomp.to_i            # old user input

      if fuel < 1                        # Screen user input for anomalies
        input = 0
      end

      if input > 3
        input = 3
      elsif input < 0
        input = 0
      end

      delta_v -= input                   # fire thrusters

      board[position] = ''               # Erase lander from board to reset
      delta_v += gravity                 # Change values from user input
      position += delta_v

      fuel -= input

      if position < 1                    # Don't allow going above start point
        delta_v = 0
        position = 1
      end
      
      # turn_bool = false

    end # else

    # end # while bool == true
    
  end # turns times do

end # run

run

