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

func _physics_process(delta):
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

