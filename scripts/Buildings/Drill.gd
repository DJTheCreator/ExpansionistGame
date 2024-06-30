class_name Drill extends StaticBody2D

var is_repaired = true
var stored_ore:int = 0

func _process(_delta):
	if is_repaired and $ReleaseOre.is_stopped():
		$ReleaseOre.start()

func _on_release_ore_timeout():
	stored_ore += 1
	$OreCounter.set_text("[center]" + str(stored_ore) + "[/center]")
