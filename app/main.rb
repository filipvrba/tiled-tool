require 'tiled_tool'
require 'fastimage'

require_relative "./arguments"

def tiles
  if @options[:tiles][:active]
    g_path_input = File.join(@options[:tiles][:input], "**/*.#{TiledTool::Constants::PNG_EXT}")
    path_files = Dir.glob(g_path_input)

    if path_files.length > 0
      options = {
        files: path_files,
        input: @options[:tiles][:input], 
        output: @options[:tiles][:output],
        tile_size: @options[:tiles][:tile_size]
      }
    
      TiledTool.generate_xml options
    else
      TiledTool::Helper.event_p('warning', "There were no suitable files to export, " +
                                "according to the application.")
    end
  end
end

tiles()
