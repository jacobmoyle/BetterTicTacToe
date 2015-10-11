# @win_lines = [
#   [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
#   [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
#   [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
# ]
# board =
#   [
#     'x',1,2,
#     3,'x',5,
#     6,7,'x'
#   ]
# player = 'x'

# def find_winner(params)
#   if @win_lines.any? { |line_indices| line_indices.all? { |index| params[:board][index] == params[:player_marker] } }
#     puts params[:player_marker]
#   end
# end

# find_winner(board: board, player_marker: player)

# class Human
#   attr_reader :alive
#   def initialize
#     @alive = true
#   end

#   def speak
#     puts "My name is #{@name}"
#   end
# end

# class Jacob < Human
#   def initialize
#     super
#     @name = 'Jacob'
#   end

# end

# test = Jacob.new
# p test.alive
# test.speak

# test2 = Human.new
# test2.speak

# if 0.between?(0,8)
#   p "YES"
# else
#   p "NO!"
# end
# begin
#   raise 'Test Error'
#   rescue Exception => error
#   p error.class
# end
# if error
#   p error.message
# end