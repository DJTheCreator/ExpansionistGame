class_name Drill extends StaticBody2D

var is_repaired = true
var stored_ore:int = 0
var max_ore:int = 10

func _ready():
	ActiveBuildings.Drills.append(self)

func _process(_delta):
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
	print(actor + " took " + str(amount) + " ore")
	#TODO give actor amount ore for holding/inventory
