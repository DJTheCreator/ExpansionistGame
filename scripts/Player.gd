extends CharacterBody2D

@export var speed := 400
@export var jump_velocity := -400

@export var player_gun:GenericFirearm

@export var gravity_scale := 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		position.x += direction * speed * delta
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# jump control
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("fire") and player_gun.canShoot():
		player_gun.fire()
	if Input.is_action_just_pressed("reload"):
		player_gun.reload()
