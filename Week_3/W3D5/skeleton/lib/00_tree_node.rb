class PolyTreeNode
    def initialize(value)
        @parent = nil 
        @value = value 
        @children = [] 
    end

    def parent 
        @parent 
    end

    def children 
        @children 
    end 

    def value 
       @value  
    end
    
    # Self -> change parent to Node
    #
    def parent=(new_parent)
         if @parent != nil 
             self.parent.children.each_with_index do |n, idx| 
                 if n == self 
                     self.parent.children.delete_at(idx)
                     break 
                 end
             end
         end

        @parent = new_parent 
        new_parent.children << self  if parent != nil 
    end

    def inspect 
        [@value, @children]
    end

    def 

end

# Parent = PolyTreeNode.new(1)
# child = PolyTreeNode.new(2)
# child.parent = Parent