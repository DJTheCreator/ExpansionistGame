extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var vision:RayCast2D
var health:int = 20

func _ready():
	vision = %EnemyVision

func _process(_delta):
	if health <= 0:
		queue_free()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if vision.is_colliding():
		var target = vision.get_collider()
		if target is Node:
			if target.is_in_group("Player"):
				#print("Found Player")
				pass
		
	move_and_slide()

func take_damage(damage):
	health -= damage
	print("Enemy has taken " + str(damage) + " damage")

