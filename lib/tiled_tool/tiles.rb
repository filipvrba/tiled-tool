module TiledTool
  module Tiles
    module_function

    def get_xml_contents options, &callback
      options[:files].each do |path_f|
        mut_size = FastImage.size(path_f)
        mut_size = Structures::Size.new(mut_size[0].to_s, mut_size[1].to_s)

        tiles_size = options[:tile_size] == nil ? mut_size : lambda do
          arr_tls = options[:tile_size].split('x')
          return Structures::Size.new(arr_tls[0].to_s, arr_tls[1].to_s)
        end.call

        name_f = File.basename path_f.sub(/\..*$/, '')
        content = Tiles.get_template(Structures::Sizes.new(mut_size, tiles_size), path_f, name_f)
        callback.call Structures::Xml.new(name_f, content)
      end
    end
  
    private
    def self.get_template sizes, path_file, name_file
      '''
<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.9" tiledversion="1.9.2" name="NAME_F" tilewidth="T_SIZE_W" tileheight="T_SIZE_H" tilecount="1" columns="1">
  <image source="PATH_F" width="I_SIZE_W" height="I_SIZE_H"/>
</tileset>
      '''.gsub('I_SIZE_W', sizes.img_size.width).gsub('I_SIZE_H', sizes.img_size.height)
      .gsub('T_SIZE_W', sizes.tile_size.width).gsub('T_SIZE_H', sizes.tile_size.height)
      .gsub('PATH_F', path_file).gsub('NAME_F', name_file).strip
    end
  end
end
