require_relative 'polytree.rb'

class KnightPathFinder

    attr_accessor :init_move, :considered_position

    VALID_POINTS=[
        [2,1],[1,2],
    [-2,1],[2,-1],
    [-1,2],[1,-2],
    [-1,-2],[-2,-1]
]

    def initialize(init_move)
        @init_move=init_move
        @considered_position=[init_move]
        @root_node=nil

        build_move_tree
    end

    def build_move_tree 
        @root_node= PolyTree.new(@init_move)
        node_tree=[@root_node]
        until node_tree.empty?
            curent_node= node_tree.shift
            new_move_positions(curent_node.value).each do |node|
                real_node= PolyTree.new(node)
                curent_node.add_child(real_node)
                node_tree<< real_node
            end
        end
    end

    def new_move_positions(pos)  #Get The valid position discluding any repetitive Position
        valid_pos=KnightPathFinder.valid_moves(pos)
        valid_pos.reject{|pos| @considered_position.include?(pos)}.each { |new_pos| @considered_position << new_pos }
    end

    def self.valid_moves (pos) #initialize the valid moves from certain position
        x,y=pos
        valid_pos=[]
        VALID_POINTS.each {|position| valid_pos << [x+position[0],y+position[1]]}
        valid_pos.reject! {|ele| !ele[0].between?(0,7)||!ele[1].between?(0,7)}
        valid_pos
    end



    def find_path(end_pos)  #Get Path to this Node
        node_pos=@root_node.dfs(end_pos)  #Retreive Node From Value
        trace_path_back(node_pos)
    end

    def trace_path_back (end_node) #Trace Back Path From Parent
        path=Array.new {[]}
        node= end_node
        until node.nil?
            path.unshift(node.value)
            node= node.parent
        end
        path
    end
end

if $PROGRAM_NAME == __FILE__
    kpf = KnightPathFinder.new([0, 0])
    p kpf.find_path([7, 7])
  end
