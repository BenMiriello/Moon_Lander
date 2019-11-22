require 'pry'

def make_board(height)
  board = ['       *                *                             *   ']
  height.times { board << ' '} # add random stars by adding one * and a random amount of spaces in a random set of tiles
  board << '              __/-|_/\/---\_________/-\/--|_/---\_'
end

def print_frame
  height = 30
  board = make_board(height)
  lander = "                 ↓ 0 m/s      /O\\"
  position = 1
  turns = 100
  fuel = 20
  delta_v = 0
  gravity = 1

  70.times { puts "\n" }
  # put
  2)

  turns.times do

    if position >= height
      if delta_v > 1
        puts "\n\n\nYou crashed! ... Somewhere, thousands of miles away, Richard Nixon is reading your obituary on live TV ...\n\n\n\n"
      else
        puts "\nYou landed safely!\n\n"
      end
      break

    else
      # board[position -1] = lander_top
      # board[position] = lander_bottom

      # plus_minus = '-'
      # if delta_v == 0
      #   plus_minus = ' '
      # elsif delta_v > 0
      #   plus_minus = '+'
      # else
      #   plus_minus = '-'
      # end

      lander = "                 ↓ #{delta_v} m/s      /O\\      fuel: #{fuel}"
      board[position] = lander

      35.times { puts "\n" }
      2.times { puts "\n"}
      board.each {|x| puts "#{x}\n"}
      2.times { puts "\n"}
      puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"

      telemetry = gets.chomp
      # sleep(1)

      if fuel < 1
        telemetry = 0
        fuel = 0
      end

      if telemetry.class != nil
        if telemetry.to_i > 0 && telemetry.to_i < 4
          delta_v -= telemetry.to_i
        elsif telemetry.to_i > 3
          telemetry = 3
        else
          telemetry = 0
        end
      end

      board[position] = ''
      delta_v += gravity
      position += delta_v

      fuel -= telemetry.to_i

      if position < 1
        delta_v = 0
        position = 1
      end

      sleep(0.25)
    end

  end

end

print_frame

########  RESOURCES  #######

# gets.chomp

# tty gems for command line

########    NEXT    ########

# fix bug where Johnathan got a crash message before he was out of fuel or had reached the surface.

# fix problem where if user inputs telemetry more than 3, fuel goes down by 3
#    but velocity doesn't change

# if you run out of fuel, make it keep going.

# switch from turns to conditional end point

# clean up input system

# make frame automatically refresh even with no input

# decide how to handle upward movement

# add telemtry feedback

# randomly generate stars

# crash animation