require_relative "00_tree_node.rb"
require 'set'

class KnightPathFinder

    @@board = Array.new(8){Array.new(8, 0)}
    attr_reader :root_node, :considered_positions

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = Set.new([pos])
        build_move_tree(@root_node) 
    end

    def build_move_tree(start_node)
        q = [] 

        new_move_positions(start_node.value).each do |i| 
            child_node = PolyTreeNode.new(i)
            start_node.children << child_node
            q << child_node
        end

        until q.empty? 
            curr_node = q.shift 
            new_move_positions(curr_node.value).each do |i|
                child = PolyTreeNode.new(i)
                curr_node.children << child 
                q << child 
            end
        end

        start_node
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

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos) 

        res = new_moves.select { |i| !@considered_positions.include?(i)}
        @considered_positions += res 
        res 
    end

end

k = KnightPathFinder.new([0,0])
# p KnightPathFinder.valid_moves([0, 0])
# p k.new_move_positions([0, 0])

res = k.build_move_tree(k.root_node)
p k.considered_positions