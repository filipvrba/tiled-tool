require 'option_parser'

@options = {
  tiles: {
    active: false,
    input: Dir.pwd,
    output: nil,
    tile_size: nil
  }
}

TILES_DESC = "Creates an xml file with all of the texture\n" +
             "information for Tile import."

OptionParser.parse do |parser|
  parser.banner(
    "A tool designed for the Tiled editor.\n" +
    "Usage: #{TiledTool::Constants::APP_NAME} [options]\n" +
    "\nOptions:"
  )
  parser.on( "-h", "--help", "Show help" ) do
    puts parser
    exit
  end
  parser.on( "-v", "--version", "Show version" ) do
    puts "Version is #{TiledTool::Constants::VERSION}"
    exit
  end
  parser.on( "-t", "--tiles", TILES_DESC ) do
    @options[:tiles][:active] = true

    OptionParser.parse do |parser|
      parser.banner(
        "#{TILES_DESC.sub("\n", ' ')}\n" +
        "Usage: #{TiledTool::Constants::APP_NAME} -t [options]\n" +
        "\nOptions:"
      )
      parser.on( "-h", "--help", "Show help" ) do
        puts parser
        exit
      end
      parser.on( "-i PATH", "--input PATH", "Where are the images for processing located?" ) do |path|
        if path
          @options[:tiles][:input] = path
        end
      end
      parser.on( "-o PATH", "--output PATH", "Which folder the xml files should be saved in." ) do |path|
        @options[:tiles][:output] = path
      end
      parser.on( "-ts SIZE", "--tile_size SIZE", "Use the 'x' of this symbol to specify the size\n" +
      "of the tiles that will be divided into.\n(e.g. 128x64)") do |size|
        if size
          @options[:tiles][:tile_size] = size
        end
      end
    end
  end
end
