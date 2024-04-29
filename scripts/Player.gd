extends Node2D

var speed = 400

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", 'down')
	position += direction * speed * delta
