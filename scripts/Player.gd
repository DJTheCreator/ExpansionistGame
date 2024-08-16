extends CharacterBody2D

@export var speed := 400

@export var player_gun:GenericFirearm

var interactable_object

func _ready():
	add_to_group("Player", true)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		position += direction * speed * delta
	
	do_visuals(get_local_mouse_position().normalized())
	move_and_slide()

func _process(_delta):
	if player_gun:
		if Input.is_action_pressed("fire") and player_gun.canShoot():
			player_gun.fire()
		if Input.is_action_just_pressed("reload"):
			player_gun.reload()
	if Input.is_action_just_pressed("interact"):
		if interactable_object:
			if interactable_object.has_method("is_player_present"):
				if interactable_object.is_player_present():
					interactable_object.toggle_ui()
	if Input.is_action_just_pressed("AI TEST"):
		get_tree().reload_current_scene()

func set_interactable_object(body):
	interactable_object = body

func do_visuals(_direction):
	var player_sprite:AnimatedSprite2D = get_node("PlayerSprite")
	if _direction.x < 0 and not player_sprite.is_flipped_h():
		player_sprite.set_flip_h(true)
	elif _direction.x > 0 and player_sprite.is_flipped_h():
		player_sprite.set_flip_h(false)
