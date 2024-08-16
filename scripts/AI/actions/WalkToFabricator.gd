class_name WalkToFabricator extends BuildingAction

func tick(actor:Node, blackboard:Blackboard):
	var target = find_closest("Fabricators", actor, blackboard)
	return safe_walk_to(target, actor, blackboard)
