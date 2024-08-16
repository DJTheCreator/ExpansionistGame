class_name IndustrialFabricator extends GenericUIBuilding

var fabricator_inventory = []

func _ready():
	ui_scene_path = "res://scenes/GUI/ui_industrial_fabricator.tscn"
	ui_node_name = "UI Industrial Fabricator"

func _process(delta):
	super._process(delta)

func _on_body_exited(body):
	super._on_body_exited(body)

func deposit_item(actor, amount=1):
	# TODO add functionality for multiple item deposits, maybe make actor.held_item an array or a touple. (item, amount)
	fabricator_inventory.append(actor.held_item) 
	print(self.name + " gained " + str(amount) + " " + actor.held_item.name)
	actor.held_item = null
