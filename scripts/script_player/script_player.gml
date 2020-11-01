/// @arg weapon
function scr_pl_weapon_state(_weap) {
	switch (_weap) {
		case "Firearm":
			return ANIM_ATTACK_FIREARM;
		case "Tube": 
			return ANIM_ATTACK_TUBE;
		case "Flashlight":
			return ANIM_FLASHLIGHT;
		default: 
			return ANIM_ATTACK_PUNCH;
	} 
}
