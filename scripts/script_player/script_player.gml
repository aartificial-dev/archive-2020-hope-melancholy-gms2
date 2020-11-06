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
	
	if ((weap_current == "Flashlight" || weap_current == "Lamp") && ammo != flash_bat_max) {
		let _fl_spr = (weap_current == "Flashlight") ? spr_pl_reload_flash : spr_pl_reload_lamp;
		animation_bind(ANIM_RELOAD, _fl_spr , 0.05 * 1.25);
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

function scr_pl_lamp() {
	let animstate = animation_get_current_state();
	let animframe = animation_get_frame();
	let cur_weap = weap_select ? inv_weap2 : inv_weap1;

	let _inv_check = inv_hand ? false : (inv_open ? gui_mouse_y > inv_mheight : true);
	if (can_move && !is_reload && inv_item_modif(cur_weap, 0, 0) > 0 && _inv_check) {
		if (mouse_check_button_pressed(mb_left) && alarm[5] == -1) {
			if (weap_current == "Flashlight") {
					flash_on = !flash_on;
					audio_play_sound(snd_flash_toggle, 0, 0);
					alarm[5] = 10;
			}
			if (weap_current == "Lamp") {
					lamp_on = !lamp_on;
					audio_play_sound(snd_flash_toggle, 0, 0);
					alarm[5] = 10;
			}
		}
	}
	
	// turn off variables
	
	// turnin off
	
	if (scr_check_light(flash_light, flash_on, "Flashlight", cur_weap, animstate)) {
		instance_destroy(flash_light);
		flash_on = 0;
		if (alarm[5] == -1) {
			audio_play_sound(snd_flash_toggle, 0, 0);
		}
	}
	if (scr_check_light(lamp_light, lamp_on, "Lamp", cur_weap, animstate)) {
		instance_destroy(lamp_light);
		lamp_on = 0;
		if (alarm[5] == -1) {
			audio_play_sound(snd_flash_toggle, 0, 0);
		}
	}
	
	// animation fix
	let _an_fix = 0;
	let _ind = floor(animframe);
	if (animstate == ANIM_IDLE) {
		_an_fix = (_ind == 2) ? 1 : 0;
	}
	if (animstate == ANIM_WALK) {
		_an_fix = (_ind == 1 || _ind == 5) ? 1 : ((_ind == 3 || _ind == 7) ? -1 : 0);
	}
	let _x = x + (6 * spr_dir);
	let _y = y - 32 - _an_fix;
	
	// lights
	if (flash_on) {
		inv_item_modif(cur_weap, 0, -0.005);
		if (!instance_exists(flash_light)) {
			flash_light = instance_create_layer(_x, _y, Layers.light, par_light_flash);
		}
		flash_light.angle = spr_dir ? 0 : 180;
		flash_light.x = _x;
		flash_light.y = _y;
	}
	
	if (lamp_on) {
		inv_item_modif(cur_weap, 0, -0.005);
		if (!instance_exists(lamp_light)) {
			lamp_light = instance_create_layer(_x, _y, Layers.light, par_light_lamp);
		}
		lamp_light.x = _x;
		lamp_light.y = _y + 11;
	}
}

/// @arg light_obj
/// @arg light_on
/// @arg weap_name
/// @arg weap_curr
/// @arg anim_stat
function scr_check_light(_obj, _light, _weap, _cur, _anim) {
	return (instance_exists(_obj) && (weap_current != _weap || on_ladder// || can_move == 0
			|| (weap_current == "Lamp" && inv_item_modif(_cur, 0, 0) == 0) || _light == 0
			|| (_anim != ANIM_IDLE && _anim != ANIM_WALK)));
}