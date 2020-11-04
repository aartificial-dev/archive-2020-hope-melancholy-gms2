/// @arg weapon
function scr_pl_weapon_state(_weap) {
	switch (_weap) {
		case "Firearm":
			return ANIM_ATTACK_FIREARM;
		case "Tube": 
			return ANIM_ATTACK_TUBE;
		case "Flashlight":
			return ANIM_IDLE;
		default: 
			return ANIM_ATTACK_PUNCH;
	} 
}


function scr_pl_reload() {
	let cur_weap = weap_select ? inv_weap2 : inv_weap1;
	let ammo = inv_item_modif(cur_weap, 0, 0);
	let do_reload = 0; // 0 - no, 1 - yes, 2 - not enough ammo
	let drop_obj = noone;
	
	if (weap_current == "Firearm" && ammo != gun_ammo_max) {
		animation_bind(ANIM_RELOAD, spr_pl_reload_gun , 0.05 * 1.25);
		let count = min(gun_ammo_max - ammo, gun_ammo_inv);
		if (count > 0) {
			audio_play_sound(snd_pistol_reload, 0, 0);
			gun_ammo_inv -= count;
			inv_item_modif(cur_weap, 0, +count);
			do_reload = 1;
			drop_obj = obj_empmag;
		} else {
			do_reload = 2;
		}
	}
	
	if (weap_current == "Flashlight" && ammo != flash_bat_max) {
		animation_bind(ANIM_RELOAD, spr_pl_reload_flash , 0.05 * 1.25);
		let count = min(flash_bat_max - ammo, flash_bat_inv);
		if (count > 0) {
			audio_play_sound(snd_flash_reload, 0, 0); // flash bat reload
			flash_bat_inv -= count;
			inv_item_modif(cur_weap, 0, +count);
			do_reload = 1;
			drop_obj = obj_empbat; // battery thing
		} else {
			do_reload = 2;
		}
	}
	
	if (do_reload == 0) {
		scr_message("mag_full");
	}
	if (do_reload == 1) {
		is_reload = 1;
		alarm[8] = animation_get_length(ANIM_RELOAD);
		let _x = x + (4 * spr_dir);
		let _y = y - 7 - 20;
		instance_create_layer(_x, _y, Layers.effect, drop_obj);
		signal_sound_emit(_x, _y, 45, obj_pl, 0.35, 35);
	}
	if (do_reload == 2) {
		scr_message("not_enough_ammo");
	}
}