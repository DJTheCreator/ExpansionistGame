class_name BuildingAction extends ActionLeaf

func find_closest(target_group:String, actor:GenericSurvivor, blackboard:Blackboard):
	var target
	var closest_member
	for member in get_tree().get_nodes_in_group(target_group):
		if closest_member == null:
			closest_member = member
	target = closest_member
	return target
	
func safe_walk_to(target:Node, actor:Node, blackboard:Blackboard):
	if target:
		actor.walk_to(target)
		if actor.get_is_navigation_finished():
			return SUCCESS
		else:
			return RUNNING
	else:
		return FAILURE
