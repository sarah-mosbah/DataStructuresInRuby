class Map

#iniit Method 1
    def initialize
     @map=Array.new {[]}
    end

    def set(key,val)
      arr = get(key)
     if arr.nil?
 
        @map << [key,val]
     else
        arr[1]=val
     end

    end

    def get(key)
        @map.each {|sub_arr| return sub_arr if sub_arr[0]==key}
        nil
    end

    def delete(key)
       arr=get(key)
        if !arr.nil?
            @map.reject! {|a| a==arr}
        end
    end
  end


  map= Map.new
  map.set(4,3)
  map.set(45,3)
  map.set(450,9)
  map.set(451,3)
  map.delete(42)

  p map