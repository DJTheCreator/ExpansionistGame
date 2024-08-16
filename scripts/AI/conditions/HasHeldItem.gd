class_name HasHeldItem extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard):
	if actor.held_item:
		return SUCCESS
	else:
		return FAILURE
