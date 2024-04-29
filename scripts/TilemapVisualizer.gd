class_name TilemapVisualizer extends Node2D
@export var floor_tilemap : TileMap # @export is like [SerializeField]
@export var wall_tilemap : TileMap
@export var floor_tile : Vector2i
@export var wall_tile : Vector2i

func paint_floor_tiles(floor_positions : Array[Vector2i]):
	paint_tiles(floor_positions, floor_tilemap, floor_tile)

func paint_tiles(positions : Array[Vector2i], tilemap : TileMap, tile : Vector2i):
	for pos in positions:
		paint_single_tile(tilemap, tile, pos)

func paint_single_tile(tilemap:TileMap, tile:Vector2i, pos:Vector2i):
	# layer (0), coords, atlas ID, tile-coords
	tilemap.set_cell(0, pos, 1, tile)

func paint_single_floor_tile(pos : Vector2i):
	floor_tilemap.set_cell(0, pos, 1, floor_tile)

func paint_single_basic_wall(pos : Vector2i, binary_type : String):
	var tile : Vector2i = Vector2i(-1, -1)
	if (binary_type == ('')):
		paint_single_tile(wall_tilemap, tile, pos)
	else:
		tile = wall_tile
		if tile != Vector2i(-1, -1):
			paint_single_tile(wall_tilemap, tile, pos)

func paint_single_corner_wall(pos : Vector2i, binary_type : String):
	var tile : Vector2i = wall_tile
	paint_single_tile(wall_tilemap, tile, pos)

func clear():
	floor_tilemap.clear()
	wall_tilemap.clear()

