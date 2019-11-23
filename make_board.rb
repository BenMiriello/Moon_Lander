

def make_board (board, height, fuel, plus_minus, delta_v, position)
  board[height + 1] = "  fuel:#{fuel}  #{plus_minus}#{delta_v.abs} m/s       _   ___    __———————————__    __     ___         __  "
  if fuel < 10
    board[height+1][0] = '  '
  end
  board[height + 2] = " This is the ground -> _/ \\_/   \\__/               \\/\\/  \\___/   \\__/\\_/\\/  \\_"
  board[position] = "                                          /O\\"

  50.times { puts "\n" }
  2.times { puts "\n"}
  board.each {|x| puts "#{x}\n"}
  2.times { puts "\n"}
  puts " * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *" # 80 across
end

