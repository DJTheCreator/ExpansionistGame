class_name Drill extends GenericBuilding

var is_repaired = true
var stored_ore:int = 0
var max_ore:int = 10

func _on_body_exited(body):
	super._on_body_exited(body)

func _process(delta):
	super._process(delta)
	if is_repaired and $ReleaseOre.is_stopped():
		$ReleaseOre.start()
	if stored_ore == max_ore:
		$ReleaseOre.paused = true
	else:
		$ReleaseOre.paused = false
	$OreCounter.set_text("[center]" + str(stored_ore) + "[/center]")

func _on_release_ore_timeout():
	stored_ore += 1

func has_ore():
	return stored_ore > 0

func take_ore(actor, amount=1):
	stored_ore -= amount
	print(actor.name + " took " + str(amount) + " ore")
	var ore = load("res://scenes/Items/GenericOre.tscn").instantiate()
	actor.held_item = ore
