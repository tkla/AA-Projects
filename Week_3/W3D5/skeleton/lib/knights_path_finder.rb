require_relative "00_tree_node.rb"

class KnightPathFinder

@@board = Array.new(8){Array.new(8, 0)}

def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    build_move_tree(@root_node) 

end

def build_move_tree(start_node)
    return nil
end 

def self.valid_moves(pos)

 row = pos[0]
 col = pos[1]
possible_move = [
    [row+2, col+1],
    [row+2, col-1],
    [row+1, col+2],
    [row-1, col+2],
    [row-2, col+1],
    [row-2, col-1],
    [row+1, col-2],
    [row-1, col-2]  
]
result_arr = []
possible_move.each do |p|
 if p[0] >= 0 && p[1] < 8 && p[0] < 8 && p[1] >= 0
    result_arr << p 
 end 
end
return result_arr
end

end

k = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([0, 0])