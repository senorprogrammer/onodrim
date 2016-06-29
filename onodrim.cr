# http://crystal-lang.org/api/Array.html
# http://crystal-lang.org/api/Random.html
# http://crystal-lang.org/api/Colorize.html

require "./lib/**"
require "benchmark"
require "colorize"
require "option_parser"

width  = 64
height = 24
depth  = 64

OptionParser.parse! do |parser|
  parser.banner = "Usage: onodrim [arguments]"
  parser.on("-w WIDTH",  "--width=WIDTH", "Number of columns") { |val| width = val }
  parser.on("-h HEIGHT", "--height=HEIGHT", "Number of rows")  { |val| height = val }
  parser.on("-d DEPTH",  "--depth=DEPTH", "Number of depths")  { |val| depth = val }
end

world = Generators::World.new(Generators::Name.new.random, width.to_i, height.to_i, depth.to_i).world
renderer = Helpers::World::Renderer.new(world)

puts "Rendering #{world.name}:"
puts renderer.to_s
