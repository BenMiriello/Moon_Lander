require 'pry'
require_relative 'intro'
require_relative 'make_board'

def prelim_make_board(height)
  board = ['             *                *                             *   ']
  height.times { board << ' '} # add random stars by adding one * and a random amount of spaces in a random set of tiles
  fuel = 0
  delta_v = 0
  board << ' '
end

def run
  height = 31                         # Start parameters
  position = 1
  turns = 100
  fuel = 20
  delta_v = 0
  gravity = 1
  board = prelim_make_board(height)

  # intro
  
  turns.times do
    
    if position >= height             # Are we there yet?
      if delta_v > 1
        puts "\n\nYou crashed! Say hello to the ground!\n\n\n"
        # Victory Board display here
      else
        puts board
        puts "\n\n\nYou landed safely! Say hello to the ground!\n\n\n"
        # Defeat board display here
      end
      break

    else
      # board[position -1] = lander_top   # Reminder to make lander bigger.
      # board[position] = lander_bottom

      plus_minus = '↓-'               # Generate telemetry panel
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

      # # # # # # # # # # # # # # #   # Now make the board
      
      make_board(board, height, fuel, plus_minus, delta_v, position)

      # # # # # # # # # # # # # # #   # Prepare for Next Turn

      input = gets.chomp.to_i         # Get user input

      if fuel < 1                     # Process user input for anomalies
        input = 0
        # fuel = 0
      end

      if input > 3
        input = 3
      elsif input < 0
        input = 0
      end

      delta_v -= input                #

      board[position] = ''            # Erase lander from board to reset
      delta_v += gravity              # Change values from user input
      position += delta_v

      fuel -= input

      if position < 1                 # Don't allow above start point
        delta_v = 0
        position = 1
      end

      # sleep(1)                      # Sleep here when refresh is automatic
    end

  end

end

run

