class Queue

    attr_accessor :length

    def initialize
     @queue=[]
     @length=0
    end
    
    

    def enqueue(el)
     @queue << el
     @length+=1
    end

    def dequeue
      @length-=1
      @queue.shift
    end

    def peek
     @queue.last
    end
  end


  queue= Queue.new

  queue.enqueue(1)
  queue.enqueue(2)
  queue.enqueue(11)
  queue.enqueue(14)

  p queue.peek