extends DrillAction


func find_closest_drill():
	var closest_drill
	for drill in ActiveBuildings.Drills:
		if closest_drill == null:
			closest_drill = drill
	self.position = closest_drill.position
