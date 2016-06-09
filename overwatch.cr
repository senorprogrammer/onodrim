require "./lib/**"
require "colorize"

world = Generators::World.new("Terra", 20, 10)

puts "Drawing #{world.name}:"
puts world.grid.to_s
