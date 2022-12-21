module TiledTool
  module Helper
    require 'fileutils'
    module_function

    def write content, path
      Helper.create_dir File.dirname(path)

      file = File.new(path, "w+")
      file.write content
      file.close

      Helper.event_p('saved', path)
    end

    def event_p event, path_f
      puts "#{Time.now.strftime("%l:%M:%S %p").lstrip} [#{Constants::APP_NAME}] #{event} #{path_f}"
    end

    def create_dir path
      unless Dir.exist? path
        FileUtils.mkdir_p path
      end
    end
  end
end
