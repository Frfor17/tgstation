// element, which can be given to a mob, and then mob can makes a holes at the walls

/datum/element/wall_holer

/datum/element/wall_holer/Attach(datum/target, allow_reinforced = TRUE, tear_time = 2 SECONDS, reinforced_multiplier = 2, do_after_key = null)
	. = ..()
	if (!isliving(target))
		return ELEMENT_INCOMPATIBLE
	src.allow_reinforced = allow_reinforced
	src.tear_time = tear_time
	src.reinforced_multiplier = reinforced_multiplier
	src.do_after_key = do_after_key
	RegisterSignals(target, list(COMSIG_HOSTILE_PRE_ATTACKINGTARGET, COMSIG_LIVING_UNARMED_ATTACK), PROC_REF(on_attacked_wall))

/datum/element/wall_holer/Detach(datum/source)
	. = ..()
	UnregisterSignal(source, list(COMSIG_HOSTILE_PRE_ATTACKINGTARGET, COMSIG_LIVING_UNARMED_ATTACK))

/datum/element/wall_holer/proc/rip_and_tear(mob/living/tearer, atom/target)
