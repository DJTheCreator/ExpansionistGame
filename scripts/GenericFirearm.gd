class_name GenericFirearm extends Node2D

var firerate:int = 100
var reload_rate:int = 1
var magsize:int = 8
var current_mag:int = magsize
var reloading:bool = false
var firing:bool = false
@export var ammotext:TextEdit
var bullet_scene = preload("res://scenes/generic_bullet.tscn")
var bullet_speed:int = 50
var bullet_direction = Vector2.UP

func _ready():
	ammotext.text = "Ammo: " + str(current_mag)

func _process(_delta):
	bullet_direction = get_local_mouse_position().normalized()

func fire():
	current_mag -= 1
	var bullet = bullet_scene.instantiate()
	bullet.set_properties(bullet_speed, bullet_direction)
	add_child(bullet)
	bullet.reparent(get_tree().current_scene)
	ammotext.text = "Ammo: " + str(current_mag)
	if current_mag <= 0:
		reload()
	firing = true
	await get_tree().create_timer(firerate/100).timeout
	firing = false

func reload():
	reloading = true
	ammotext.text = "Reloading..."
	await get_tree().create_timer(reload_rate).timeout
	reloading = false
	if reloading == false:
		current_mag=magsize
		ammotext.text = "Ammo: " + str(current_mag)

func canShoot():
	if reloading or firing:
		return false
	else:
		return true
