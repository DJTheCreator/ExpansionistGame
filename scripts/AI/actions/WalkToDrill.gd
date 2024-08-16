class_name WalkToDrill extends BuildingAction

func tick(actor:Node, blackboard:Blackboard):
	var target = find_closest("Drills", actor, blackboard)
	return safe_walk_to(target, actor, blackboard)
