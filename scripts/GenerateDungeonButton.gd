extends Button
@export var abstract_dungeon_generator : AbstractDungeonGenerator

func _on_pressed():
	abstract_dungeon_generator.GenerateDungeon()
