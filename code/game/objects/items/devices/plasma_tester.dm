// this pasma is 100% pure!
/obj/item/plasma_tester
	name = "plasma tester"
	desc = "brand plasma tester"
	icon = 'icons/obj/devices/plasma_tester.dmi'
	icon_state = "plasma_tester_active1"

/obj/item/plasma_tester/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(interacting_with)
		playsound(src, SFX_INDUSTRIAL_SCAN, 20, TRUE, -2, TRUE, FALSE)
		var/obj/item/stack/sheet/mineral/plasma = interacting_with
		user.visible_message(
			span_notice("[user] scanning [interacting_with]'s purity."),
			span_notice("You scanned [interacting_with]'s purity.")
		)
		src.say("SCANNED FINISHED! This plasma is 100% FUCKING pure!!!")

// /obj/item/flashlight/update_icon_state()
// 	. = ..()
// 	if
