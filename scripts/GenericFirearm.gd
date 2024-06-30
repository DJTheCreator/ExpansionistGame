class_name GenericFirearm extends Node2D

var damage:int = 2
var firerate:int = 100
var reload_rate:int = 1
var magsize:int = 8
var current_mag:int = magsize
var reloading:bool = false
var firing:bool = false
@export var ammotext:TextEdit
var bullet_scene = preload("res://scenes/generic_bullet.tscn")
var bullet_speed:int = 500
var bullet_direction = Vector2.UP

func _ready():
	ammotext.text = "Ammo: " + str(current_mag)

func _process(_delta):
	bullet_direction = get_local_mouse_position().normalized()
	do_visuals(bullet_direction)

func fire():
	current_mag -= 1
	var bullet = bullet_scene.instantiate()
	bullet.set_properties(bullet_speed, bullet_direction, damage)
	get_tree().current_scene.add_child(bullet)
	bullet.position = get_node("GunSprite/FiringPoint").global_position
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

func do_visuals(_direction):
	var gun_sprite:AnimatedSprite2D = get_node("GunSprite")
	var firing_point = get_node("GunSprite/FiringPoint")
	if _direction.x < 0 and not gun_sprite.is_flipped_v():
		gun_sprite.set_flip_v(true)
		firing_point.setflip_v(true)
	elif _direction.x > 0 and gun_sprite.is_flipped_v():
		gun_sprite.set_flip_v(false)
		firing_point.set_flip_v(false)
	if Input.is_action_pressed("aim"):
		gun_sprite.look_at(get_global_mouse_position())
	else:
		if not gun_sprite.is_flipped_v():
			gun_sprite.look_at(to_global(Vector2.RIGHT))
		else:
			gun_sprite.look_at(to_global(Vector2.LEFT))
	# FIXME When gun_sprite.set_flip_v(true) the FiringPoint is flipped and is no longer in the correct position
