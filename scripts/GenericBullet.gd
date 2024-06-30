class_name GenericBullet extends Area2D

var speed:int
var direction
var damage:int

func set_properties(_speed, _direction, _damage):
	speed = _speed
	direction = _direction
	damage = _damage

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body is Node2D:
		if body.has_method("take_damage"):
			body.take_damage(damage)
			queue_free()
