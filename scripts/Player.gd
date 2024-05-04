extends Node2D

@export var speed := 400

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", 'down')
	position.x += direction.x * speed * delta
	print(speed) #this output isnt changing when I change the inspector value
