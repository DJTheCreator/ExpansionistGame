class_name GenericUIBuilding extends GenericBuilding
var ui_active = false

var ui_scene_path:String
var ui_node_name:String

@onready var ui_layer = %UICanvasLayer

func _on_body_exited(body):
	if body == player:
		if ui_active:
			toggle_ui()
	super._on_body_exited(body)

func toggle_ui():
	if ui_layer.get_node(ui_node_name):
		var ui = ui_layer.get_node(ui_node_name)
		ui_layer.remove_child(ui)
		ui_active = false
	else:
		ui_layer.add_child(load(ui_scene_path).instantiate())
		ui_active = true

func _process(delta):
	super._process(delta)
