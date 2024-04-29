class_name AbstractDungeonGenerator extends Node2D
@export var tilemap_visualizer : TilemapVisualizer
@export var wall_generator : WallGenerator
@export var start_position : Vector2i

func _ready():
	#GenerateDungeon()
	pass

func GenerateDungeon():
	tilemap_visualizer.clear()
	_run_procedural_generation()

func _run_procedural_generation():
	push_error() #Godot does not have abstract classes so we push an error if this class is not overriden by the child class
