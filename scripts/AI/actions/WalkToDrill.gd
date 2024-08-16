class_name WalkToDrill extends DrillAction

func tick(actor:Node, blackboard:Blackboard):
	var target = find_closest("Drills", actor, blackboard)
	return safe_walk_to(target, actor, blackboard)
