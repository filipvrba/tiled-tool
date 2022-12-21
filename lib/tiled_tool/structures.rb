module TiledTool
  module Structures
    class Size < Struct.new(:width, :height)
    end
    class Sizes < Struct.new(:img_size, :tile_size)
    end
    class Xml < Struct.new(:name, :content)
    end
  end
end