require "./lib/**"

world = Generators::World.new("Terra", 10, 10)

puts world.grid.at(3, 3)
puts world.grid.size
