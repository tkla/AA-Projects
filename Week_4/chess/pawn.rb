require_relative 'piece'

class Pawn < Piece
    def initialize (color = :white, board = nil, pos = nil)
        super
        @start_pos = pos 
    end

    def symbol 
        ("\u2659".encode('utf-8')).colorize(color)
    end

    def moves
        
        forward_steps + side_attacks
    end

    private 
    def at_start_row? 
        self.pos == @start_pos 
    end

    #returns 1 or -1
    def forward_dir
        if @start_pos[0] == 1 
            1
        else
            -1
        end
    end

    def forward_steps
        res = [] 
        new_row = self.pos[0] + forward_dir
        new_pos = [new_row, self.pos[1]]

        if board[new_pos] != nil && board[new_pos].empty? 
            res << [new_row, self.pos[1]]

            if at_start_row? 
                new_row += forward_dir
                new_pos = [new_row, self.pos[1]]

                if board[new_pos].empty?
                    res << [new_row, self.pos[1]]
                end
            end
        end
        res
    end

    def side_attacks 
        res = [] 
        x,y = self.pos 
        left_attack = [x + forward_dir, y - 1]
        right_attack = [x + forward_dir, y + 1]
        
        res << left_attack if board[left_attack] != nil && board[left_attack].color != self.color && !board[left_attack].empty?
        res << right_attack if board[right_attack] != nil && board[right_attack].color != self.color && !board[right_attack].empty?
        res
    end
end