extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/DefenseButton.modulate = Color(0,0,1)
	$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/OffenseButton.modulate = Color(1,0,0)
	$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/DecorButton.modulate = Color(0,1,0)
	$MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/OtherButton.modulate = Color(1,0,1)
	
	$MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Defense.modulate = Color(0,0,1)
	$MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Offense.modulate = Color(1,0,0)
	$MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Decor.modulate = Color(0,1,0)
	$MarginContainer/HBoxContainer/VBoxContainer/TabContainer/Other.modulate = Color(1,0,1)

func _on_defense_button_pressed():
	%TabContainer.current_tab = 0

func _on_offense_button_pressed():
	%TabContainer.current_tab = 1

func _on_decor_button_pressed():
	%TabContainer.current_tab = 2

func _on_other_button_pressed():
	%TabContainer.current_tab = 3
