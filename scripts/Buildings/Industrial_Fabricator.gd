extends Area2D

var player_present
var player:CharacterBody2D
var ui_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("Player"):
			if body.has_method("set_interactable_object"):
				player = body
				player.set_interactable_object(self)
				player_present = true
				break
			# TODO make an icon appear above the hut with the interact key (must depend on the user settings)


func is_player_present():
	return player_present

func _on_body_exited(body):
	if body == player:
		if ui_active:
			toggle_ui()
		player.set_interactable_object(null)
		player = null
		player_present = false

func toggle_ui():
	var camera:Camera2D  = player.get_node("Camera")
	if camera.get_node("UI Industrial Fabricator"):
		var ui = camera.get_node("UI Industrial Fabricator")
		camera.remove_child(ui)
		ui_active = false
	else:
		camera.add_child(load("res://scenes/GUI/ui_industrial_fabricator.tscn").instantiate())
		ui_active = true
