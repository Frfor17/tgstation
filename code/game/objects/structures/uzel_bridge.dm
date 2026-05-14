/obj/structure/usel_bridge
	name = "USEL Bridge"
	desc = "allows to provide a way to desirable location, without maneuvers and docking procedure"
	icon = 'icons/obj/structures.dmi'
	icon_state = "bridge_control"

	var/extended = FALSE
	var/bridge_length = 5
	var/list/bridge_turfs = list()

/obj/structure/usel_bridge/attack_hand(mob/user)
	. = ..()
	// if(extended)
	// 	retract_bridge()
	// else
	extend_bridge()

/obj/structure/usel_bridge/proc/extend_bridge()
	var/turf/current = get_turf(src)
	// var/direction = get_dir(src, current)
	var/direction = SOUTH

	for(var/i = 1 to bridge_length)
		// var/turf/next_turf = get_step(current, direction)
		// if(!next_turf)
		// 	break
		var/turf/next_turf = get_step(current, direction)

		current.place_on_top(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)

		var/turf/left_wall = get_step(current, turn(direction, 90))
		left_wall.place_on_top(/turf/closed/wall/uzel_bridge)

		var/turf/right_wall = get_step(current, turn(direction, -90))
		right_wall.place_on_top(/turf/closed/wall/mineral/titanium)
		playsound(src, 'sound/machines/airlock/airlock.ogg', 50, TRUE)
		sleep(0.5 SECONDS)
		current = next_turf

		// create floor
		// if(isspaceturf(next_turf) || isopenspaceturf(next_turf))
		// 	next_turf.place_on_top(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)


		// create walls

		// var/turf/left_wall = get_step(next_turf, turn(direction, 90))
		// var/turf/right_wall = get_step(next_turf, turn(direction, -90))

		// if(isspaceturf(left_wall) || isopenspaceturf(left_wall))
		// 	left_wall.place_on_top(/turf/closed/wall/mineral/titanium)
		// 	bridge_turfs += left_wall

		// if(isspaceturf(right_wall) || isopenspaceturf(right_wall))
		// 	right_wall.place_on_top(/turf/closed/wall/mineral/titanium)
		// 	bridge_turfs += right_wall

		// moving forward, next iteration
		// current = next_turf


		// var/turf/left_wall = get_step(next_turf, turn(direction, 90))
		// var/turf/right_wall = get_step(next_turf, turn(direction, -90))

		// if(isspaceturf(right_wall) || isopenspaceturf(right_wall))
		// 	right_wall.place_on_top(/turf/closed/wall/mineral/titanium)

	extended = TRUE

// /obj/structure/shuttle_bridge/proc/retract_bridge()
// 	if(!extended)
// 		return

// 	for(var/turf/T in bridge_turfs)
// 		for(var/obj/structure/S in T)
// 			if(istype(S, /obj/structure/grille))
// 				qdel(S)

