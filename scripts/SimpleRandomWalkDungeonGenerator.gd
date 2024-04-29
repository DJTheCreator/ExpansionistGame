class_name SimpleRandomWalkDungeonGenerator extends AbstractDungeonGenerator

@export var iterations : int = 10
@export var walk_length : int = 300
var _random_walk_parameters = [iterations, walk_length]
# Because this function name is the same as in AbstractDungeonGenerator, the method is overridden
func _run_procedural_generation():
	var floor_positions : Array[Vector2i] = run_random_walk(_random_walk_parameters, start_position)
	tilemap_visualizer.clear()
	tilemap_visualizer.paint_floor_tiles(floor_positions)
	wall_generator.create_walls(floor_positions, tilemap_visualizer)

func run_random_walk(parameters, pos : Vector2i):
	var current_position : Vector2i = pos
	var floor_positions : Array[Vector2i] = []
	for i in range(parameters[0]):
		var path : Array[Vector2i] = simple_random_walk(current_position, parameters[1])
		floor_positions += path
		current_position = floor_positions[RandomNumberGenerator.new().randi_range(0, len(floor_positions)-1)]
	return floor_positions

func simple_random_walk(start_position : Vector2i, walk_length : int):
	var path : Array[Vector2i] = []
	path.append(start_position)
	var previous_position : Vector2i = start_position
	for i in range(walk_length):
		var new_position : Vector2i = previous_position + get_random_direction_horizontal_bias()
		path.append(new_position)
		previous_position = new_position
	return path

func get_random_direction_horizontal_bias():
	return random_walk_horizontal_bias[RandomNumberGenerator.new().randi_range(0, len(random_walk_horizontal_bias) -1)]

const random_walk_horizontal_bias = [Vector2i(0,1),Vector2i(1,0),Vector2i(0,-1),Vector2i(-1,0),Vector2i(1,0),Vector2i(-1,0),Vector2i(1,0),Vector2i(-1,0),Vector2i(1,0),Vector2i(-1,0),Vector2i(1,0),Vector2i(-1,0),Vector2i(1,0),Vector2i(-1,0)]
