extends GenericUIBuilding

func _ready():
	ui_scene_path = "res://scenes/GUI/ui_industrial_fabricator.tscn"
	ui_node_name = "UI Industrial Fabricator"

func _process(delta):
	super._process(delta)

func _on_body_exited(body):
	super._on_body_exited(body)
