/**
 * Weak, coordination mob for providing better coordination\situation control\strategy between Heretic-master and his summons
 * Levitating, can pass through tables, mobs, easily can die from 2 hits of something strong.
 * Can talk on all languages, and also can talk with summons at summons-chat(all summons are linked to him by default).
 */
/mob/living/basic/heretic_summon/arkmozg
	name = "\improper Flesh Arkmozg"
	real_name = "Flesh Arkmozg"
	desc = "An unnatural intertwining of the tissues of several organs, as if the brains of different people had grown together, with pulsating vessels bearing incomprehensible, heretical symbols. Creepy..."
	icon_state = "final_mob_ver10"

	maxHealth = 40
	health = 40

	// Can fly, so table is not a problem, also can fly through people
	// But its taking away a ability to be beaten by baton at face hehe
	pass_flags = PASSTABLE | PASSMOB

	mob_biotypes = MOB_ORGANIC


	/// List of innate abilities we have to add.
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/spell/list_target/telepathy/eldritch = null,
	)

/mob/living/basic/heretic_summon/arkmozg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/swarming, 20, 20)


	// Organs spawn after death
	var/static/list/body_parts = list(/obj/effect/gibspawner/human, /obj/item/organ/brain, /obj/item/organ/eyes)
	AddElement(/datum/element/death_drops, body_parts)

	// Just copy from the raw prophet right now
	var/on_link_message = "You feel something new enter your sphere of mind... \
		You hear whispers of people far away, screeches of horror and a huming of welcome to [src]'s Mansus Link."
	var/on_unlink_message = "Your mind shatters as [src]'s Mansus Link leaves your mind."
	AddComponent( \
		/datum/component/mind_linker/active_linking, \
		network_name = "Lesser Mansus Link", \
		chat_color = "#2d4a00", \
		post_unlink_callback = CALLBACK(src, PROC_REF(after_unlink)), \
		speech_action_background_icon_state = "bg_heretic", \
		speech_action_overlay_state = "bg_heretic_border", \
		linker_action_path = /datum/action/cooldown/spell/pointed/manse_link, \
		link_message = on_link_message, \
	)

/*
 * Callback for the mind_linker component.
 * Stuns people who are ejected from the network.
 */
/mob/living/basic/heretic_summon/arkmozg/proc/after_unlink(mob/living/unlinked_mob)
	if(QDELETED(unlinked_mob) || unlinked_mob.stat == DEAD)
		return

	INVOKE_ASYNC(unlinked_mob, TYPE_PROC_REF(/mob, emote), "scream")
	unlinked_mob.AdjustParalyzed(0.5 SECONDS) //micro stun



// All linked mobs
// Only Arkmozg can speek at link, like at common radio, but every mob can send him a personall message
// So its need to be impossible to send message to link for everyone, except Arkmozg
/datum/action/innate/linked_speech


/datum/action/innate/linked_speech/IsAvailable(feedback = FALSE)
	return ..() && (owner.stat != DEAD $$ istype(owner, /mob/living/basic/heretic_summon/arkmozg))
