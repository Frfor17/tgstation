/datum/quirk/social_anxiety
	name = "Phobia of Womans"
	desc = "Womans"
	icon = FA_ICON_COMMENT_SLASH
	value = -3
	gain_text = span_danger("You start worrying about what you're saying.")
	lose_text = span_notice("You feel easier about talking again.")

/datum/quirk/social_anxiety/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_MOB_EYECONTACT, PROC_REF(womans_near))
	RegisterSignal(quirk_holder, COMSIG_MOB_EXAMINATE, PROC_REF(too_much_womans))
	RegisterSignal(quirk_holder, COMSIG_MOB_SAY, PROC_REF(oh_my_god))
	quirk_holder.apply_status_effect(/datum/status_effect/speech/stutter/anxiety, INFINITY)

/datum/quirk/social_anxiety/proc/womans_near(datum/source, mob/living/other_mob, triggering_examiner)
