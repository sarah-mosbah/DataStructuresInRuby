class Node
    attr_accessor :children, :is_termination
    def initialize 
        @children={}
        @is_termination=false
    end
end



require "byebug"
class Trie
    attr_accessor :root
    def initialize
        @root= Node.new
    end


    def insert(word, root=@root)
       
        letter=word[0]
        if !root.children.has_key?(letter)
            root.children[letter]= Node.new
        end
        if word.length===1
            root.children[letter].is_termination=true
        else
            insert(word.slice(1, word.length), root.children[letter])
        end

        
    end

    def search (word, root=@root)
        if word.length==0
           return root.is_termination
        end
       
        letter=word[0]
        if !root.children.has_key?(letter)
           return false
        else
            return search(word.slice(1, word.length), root.children[letter])
        end


    end
end

t= Trie.new
t.insert("sarah")
t.insert("sar")
t.insert("x")
t.insert("xy")
p t.search("sah")
p t.search("xy")