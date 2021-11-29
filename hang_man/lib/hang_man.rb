require_relative "hang_man/version"

module HangMan
end
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/hang_man/**/*.rb"].each { |file| require file }

