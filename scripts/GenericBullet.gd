class_name GenericBullet extends Area2D

var speed:int
var direction

func set_properties(_speed, _direction):
	speed = _speed
	direction = _direction

func _physics_process(delta):
	position += direction * speed * delta
