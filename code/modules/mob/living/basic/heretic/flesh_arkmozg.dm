/**
 * Weak, coordination mob for providing better coordination\situation control\strategy between Heretic-master and his summons
 * Levitating, can pass through tables, mobs, easily can die from 2 hits of something strong.
 * Can talk on all languages, and also can talk with summons at summons-chat(all summons are linked to him by default).
 */
/mob/living/basic/heretic_summon/arkmozg
	name = "\improper Flesh Arkmozg"
	real_name = "Flesh Arkmozg"
	desc = "An unnatural intertwining of the tissues of several organs, as if the brains of different people had grown together, with pulsating vessels bearing incomprehensible, heretical symbols. Creepy..."
	icon_state = "final_mob_ver4"

	maxHealth = 40
	health = 40

	// Can fly, so table is not a problem, also can fly through people
	// But its taking away a ability to be beaten by baton at face hehe
	pass_flags = PASSTABLE | PASSMOB

	mob_biotypes = MOB_ORGANIC


	/// List of innate abilities we have to add.
	var/static/list/innate_abilities = list()

/mob/living/basic/heretic_summon/arkmozg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/swarming, 20, 20)
