# http://crystal-lang.org/api/Array.html
# http://crystal-lang.org/api/Random.html
# http://crystal-lang.org/api/Colorize.html

require "./lib/**"
require "benchmark"
require "colorize"
require "option_parser"

width  = 64
height = 24

OptionParser.parse! do |parser|
  parser.banner = "Usage: onodrim [arguments]"
  parser.on("-w WIDTH", "--width=WIDTH", "Number of columns") { |val| width = val }
  parser.on("-h HEIGHT", "--height=HEIGHT", "Number of rows") { |val| height = val }
end

world = Generators::World.new(Generators::Name.new.random, height.to_i, width.to_i)

puts "Rendering #{world.name}:"
puts world.grid.to_s
