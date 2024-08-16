class_name GenericBuilding extends Area2D

@onready var animated_sprite_2d = $Sprite
@onready var detection_area = $DetectionArea
var player:CharacterBody2D
var player_present = false

var survivor:CharacterBody2D
var survivor_present = false

func _process(_delta):
	for body in get_overlapping_bodies():
		if body.has_method("set_interactable_object"):
			if body.is_in_group("Player"):
				player = body
				player.set_interactable_object(self)
				player_present = true
				break
			if body.is_in_group("Survivors"):
				survivor = body
				survivor.set_interactable_object(self)
				survivor_present = true

func is_player_present():
	return player_present
	
func is_survivor_present():
	return survivor_present

func _on_body_exited(body):
	player.set_interactable_object(null)
	player = null
	player_present = false
