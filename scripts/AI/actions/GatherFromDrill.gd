class_name GatherFromDrill extends ActionLeaf

var drill:Drill = null
func tick(actor:Node, blackboard:Blackboard):
	print("drill: " + type_string(typeof(drill)) + "  |   actor_building: " + type_string(typeof(actor.interactable_object)))
	if typeof(actor.interactable_object) == typeof(drill):
		drill = actor.interactable_object
	if drill and drill.has_ore() and actor.get_is_navigation_finished() and not actor.held_item:
		drill.take_ore(actor)
		print("I GOT SOMETHING")
		return SUCCESS
	else:
		return FAILURE
