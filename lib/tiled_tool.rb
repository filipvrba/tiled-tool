require 'tiled_tool/constants'
require 'tiled_tool/structures'
require 'tiled_tool/tiles'
require 'tiled_tool/helper'

module TiledTool
  module_function

  def generate_xml options
    xml_count = 0
    l_path_o = lambda { return get_path(options) }

    Tiles.get_xml_contents(options) do |s_xml|
      
      name_fx = "#{s_xml.name}.xml"
      path_fo = File.join(l_path_o.call, name_fx)

      Helper.write s_xml.content, path_fo
      xml_count += 1
    end

    Helper.event_p('done', "In the '#{l_path_o.call}' folder, #{xml_count} xml files were created. ")
  end

  def get_path options
    options[:output] == nil ?
      File.join(options[:input], Constants::APP_NAME) :
      options[:output]
  end
end
