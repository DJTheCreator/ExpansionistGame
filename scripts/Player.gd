extends CharacterBody2D

@export var speed := 400
@export var jump_velocity := -400

@export var player_gun:GenericFirearm

@export var gravity_scale := 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var interactable_object

func _ready():
	add_to_group("Player", true)

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		position.x += direction * speed * delta
	
	do_visuals(get_local_mouse_position().normalized())
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# jump control
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
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

func set_interactable_object(body):
	interactable_object = body

func do_visuals(_direction):
	var player_sprite:AnimatedSprite2D = get_node("PlayerSprite")
	if _direction.x < 0 and not player_sprite.is_flipped_h():
		player_sprite.set_flip_h(true)
	elif _direction.x > 0 and player_sprite.is_flipped_h():
		player_sprite.set_flip_h(false)
