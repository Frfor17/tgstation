#define HOLED_WALL_HOLE 2
#define HOLED_WALL_DAMAGED 1
#define HOLED_WALL_INITIAL 0

/**
 * Component(which is child of /datum/component/torn_wall) applied to a wall to make a hole in it.
 * If component is applied to something which already has it, stage increases.
 * Wall will get the hole on third application.
 * Can be fixed using a welder
 */
/datum/component/hole_wall
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS

	var/current_stage = HOLED_WALL_INITIAL

	var/atom/dir_for_hole = 1

	var/atom/dir_of_tearer = 1

/datum/component/torn_wall/torn_wall_hole/Initialize(current_stage, dir_of_tearer = 1)
	. = ..()
	if (!isclosedturf(parent) || isindestructiblewall(parent))
		return COMPONENT_INCOMPATIBLE
	src.current_stage = current_stage || src.current_stage
	src.dir_for_hole = dir_of_tearer

/datum/component/torn_wall/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examined))
	RegisterSignal(parent, COMSIG_ATOM_TOOL_ACT(TOOL_WELDER), PROC_REF(on_welded))
	RegisterSignal(parent, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(on_update_overlays))
	RegisterSignal(parent, COMSIG_TURF_CHANGE, PROC_REF(on_turf_changed))
	apply_visuals()

/datum/component/torn_wall/UnregisterFromParent()
	var/atom/atom_parent = parent
	UnregisterSignal(parent, list(
		COMSIG_ATOM_EXAMINE,
		COMSIG_ATOM_TOOL_ACT(TOOL_WELDER),
		COMSIG_ATOM_UPDATE_OVERLAYS,
		COMSIG_TURF_CHANGE,
	))
	atom_parent.update_appearance(UPDATE_ICON)
