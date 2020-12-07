class PolyTreeNode

    attr_accessor :parent, :children, :value
    def initialize(value)
        @value=value
        @parent=nil
        @children=[]
    end

    def parent=(value)
     return if @parent==value 
   
     @parent.children.reject! {|node| node==self} unless @parent.nil?
     @parent=value
     @parent.children.push(self) unless @parent.nil?

     self
    end


    def add_child(child_node)
         child_node.parent=self
    end

    def remove_child(child_node)
        child_node.parent=nil
        self.children.reject! {|node| node==child_node}
    end


    def dfs(target_value)
     return self if target_value==self.value

     self.children.each do |child|
         search_result=child.dfs(target_value)
         return search_result unless search_result.nil?
     end
     nil
    end

    def bfs(target_value)

        queue=[self]

        until queue.empty?
            el=queue.shift
            return el if target_value== el.value
             el.children.each {|ch| queue << ch}
        end
        nil
    end
end
