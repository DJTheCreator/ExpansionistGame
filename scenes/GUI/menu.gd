extends Control

var toggle = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if toggle:
			#for button:TextureButton in $HBoxContainer/VBoxContainer/TabContainer/Items.get_children():
				#button.scale = Vector2(1,1)
			$HBoxContainer/VBoxContainer/TabContainer.scale = Vector2(1,1)
			toggle = false
		else:
			#for button:TextureButton in $HBoxContainer/VBoxContainer/TabContainer/Items.get_children():
				#button.scale = Vector2(.25,.25)
			$HBoxContainer/VBoxContainer/TabContainer.scale = Vector2(.5,.5)
			toggle = true
