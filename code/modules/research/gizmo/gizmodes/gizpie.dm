/datum/gizmodes/pie_thrower
	guaranteed_active_gizmodes = list(
		/datum/gizpulse/throw_pie,
	)

	var/datum/weakref/pie_target

/datum/gizpulse/scan/activate(atom/movable/holder, datum/gizmodes/master, datum/gizmo_interface/interface)

