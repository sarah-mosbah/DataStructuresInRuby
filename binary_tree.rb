class BinaryTree

    attr_accessor :left, :right, :val
    def initialize(val)
        @left=nil
        @right=nil
        @val=val
    end



    def self.in_order(root)    #D->B->E->A->C->F #lft, self, right
       return if root.nil?

       in_order(root.left)
       puts "#{root.val}"
       in_order(root.right)
    end

    def self.pre_order(root)  #A->B->D->E->C->F  #self,lft, right
        return if root.nil?
 
        puts "#{root.val}"
        pre_order(root.left)
        pre_order(root.right)
    end
 


    def self.post_order(root)  #D->E->B->F->C->A left, right,self
        return if root.nil?

        post_order(root.left)
        post_order(root.right)

        puts "#{root.val}"
     end



end

a= BinaryTree.new("A")
b= BinaryTree.new("B")
c= BinaryTree.new("C")
d= BinaryTree.new("D")
e= BinaryTree.new("E")
f= BinaryTree.new("F")

a.left=b
a.right=c
c.right=f
b.left=d
b.right=e

BinaryTree.in_order(a)