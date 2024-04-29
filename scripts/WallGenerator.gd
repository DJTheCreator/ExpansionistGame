class_name WallGenerator extends Node2D
func create_walls(floor_positions : Array[Vector2i], tilemap_visualizer : TilemapVisualizer):
	var all_wall_positions = find_walls_in_directions(floor_positions, eight_directions_list)
	create_basic_wall(tilemap_visualizer, all_wall_positions, floor_positions)

func create_basic_wall(tilemap_visualer : TilemapVisualizer, wall_positions : Array[Vector2i], floor_positions : Array[Vector2i]):
	var neighbors_binary_type : String = 'ignore'
	for pos in wall_positions:
		tilemap_visualer.paint_single_basic_wall(pos, neighbors_binary_type)

func find_walls_in_directions(floor_positions : Array[Vector2i], directions_list : Array[Vector2i]):
	var wall_positions : Array[Vector2i] = []
	for pos in floor_positions:
		for direction in directions_list:
			var neighbor_position = pos + direction
			if not neighbor_position in floor_positions:
				wall_positions.append(neighbor_position)
	return wall_positions

const eight_directions_list : Array[Vector2i] = [Vector2i(0,1),Vector2i(1,1),Vector2i(1,0),Vector2i(1,-1),Vector2i(0,-1),Vector2i(-1,-1),Vector2i(-1,0),Vector2i(-1,1)]
