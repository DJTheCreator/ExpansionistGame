class_name DepositInFabricator extends ActionLeaf

var fabricator:IndustrialFabricator = null
func tick(actor:Node, blackboard:Blackboard):
	if actor.interactable_object.get_script().get_global_name() == "IndustrialFabricator":
		fabricator = actor.interactable_object
	if fabricator and actor.get_is_navigation_finished() and actor.held_item:
		fabricator.deposit_item(actor)
		fabricator = null
		return SUCCESS
	else:
		fabricator = null
		return FAILURE
