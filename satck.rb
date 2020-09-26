class Stack

    attr_accessor :length

    def initialize
        @stack=[]
        @length=0
    end


    def push(el)
        @stack << el
        @length +=1
    end
  
    def pop
        poped_value= @stack.pop
        @length -=1
        poped_value
    end
  
      def peek
        @stack[-1]
      end
end


stack=Stack.new

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
p stack.pop
p stack.peek