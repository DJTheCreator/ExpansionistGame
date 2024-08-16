class_name GatherFromDrill extends ActionLeaf

var drill:Drill = null
func tick(actor:Node, blackboard:Blackboard):
	if actor.interactable_object.get_script().get_global_name() == "Drill":
		drill = actor.interactable_object
	if drill and drill.has_ore() and actor.get_is_navigation_finished() and not actor.held_item:
		drill.take_ore(actor)
		drill = null
		return SUCCESS
	else:
		drill = null
		return FAILURE
