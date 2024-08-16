class_name GenericSurvivor extends CharacterBody2D

var speed = 4000
@export var target:Node2D = null
@onready var nav_agent = $NavigationAgent2D
@onready var agent_ai = $AgentAI

var held_item = null
var finished_pathfinding = false
var interactable_object = null

func _ready():
	setup()

func setup():
	if target:
		nav_agent.target_position = target.global_position

func _physics_process(delta):
	if target:
		nav_agent.target_position = target.global_position
	if nav_agent.is_navigation_finished():
		return
	var current_agent_position = global_position
	var next_path_position = nav_agent.get_next_path_position()
	velocity = current_agent_position.direction_to(next_path_position) * speed * delta
	
	move_and_slide()

func set_interactable_object(body):
	interactable_object = body

func walk_to(_target):
	target = _target

func get_is_navigation_finished():
	return nav_agent.is_target_reached()
