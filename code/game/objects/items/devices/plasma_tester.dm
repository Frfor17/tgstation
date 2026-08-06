// this pasma is 100% pure!
/obj/item/plasma_tester
	icon = "plasma_tester_active1"

/obj/item/plasma_tester/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(isplasma(interacting_with))
		playsound(src, SFX_INDUSTRIAL_SCAN, 20, TRUE, -2, TRUE, FALSE)

/obj/item/flashlight/update_icon_state()
	. = ..()
	if
