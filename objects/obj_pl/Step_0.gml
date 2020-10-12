/// @description Move
// You can write your code in this editor

event_inherited();

move = 0;
if (can_move) {
	move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	if (keyboard_check_pressed(vk_tab)) {
		inv_open = !inv_open;
	}
	if ((mouse_wheel_up() || mouse_wheel_down()) && !is_attack && !is_reload) {
		weap_select = 1 - weap_select;
	}
	
	if (keyboard_check(vk_shift)) {
		move = 0;
		is_smoke = 0;
		standing_time = 0;
		if (!is_attack) {	spr_dir = sign(mouse_x - x); }
	}
	if (is_reload) {
		move = 0;
		is_smoke = 0;
		standing_time = 0;
	}
	
	// if item {in hand: block} else if inv open {if mouse {in inv: block} else not}
	let _inv_check = inv_hand ? false : (inv_open ? gui_mouse_y > inv_mheight : true);
	if (mouse_check_button_pressed(mb_left) && keyboard_check(vk_shift) && !is_attack && !is_reload && _inv_check) {
		// SHOOT or PUNCH
		//show_debug_message(animation_get_length(state));
		if (weap_current == "Firearm") {
			let _x = x + ((- 4) * spr_dir);
			let _y = y - 7 - 24;
			let _flip = (weap_ang > 90 && weap_ang < 270) ? -1 : 1;
			let len_x = _x + lendir_x(20, _flip, weap_ang);
			let len_y = _y + lendir_y(20, _flip, weap_ang);
			if (!collision_line(_x, _y, len_x, len_y, par_unwalk, 0, 0)) {
				is_attack = scr_attack_shoot();
				if (is_attack) {
					let state = scr_pl_weapon_state(weap_current);
					alarm[8] = animation_get_length(state);
				}
			} else {
				audio_play_sound(snd_pistol_ofa, 0, 0);
			}
		}
	} else if (!is_attack && !is_reload) {
		let _x = x + ((- 4) * spr_dir);
		let _y = y - 7 - 24;
		weap_ang = point_direction(_x, _y, mouse_x, mouse_y);
	}
	if (is_attack) {
		let im_index = animation_get_frame();
		if (ceil(im_index) == 3) {
			/// BEAT HERE
			if (weap_current == "Tube") {
				scr_attack_swoosh(x, y - 24);
			} else {
				scr_attack_punch(x, y - 24);
			}
		}
	}

	if (keyboard_check_pressed(ord("R")) && !is_reload && !is_attack) {
		// DO RELOAD
		//let sound = choose(snd_pistol_cock_1, snd_pistol_cock_2, snd_pistol_cock_3);
		let count = min(gun_ammo_max - gun_ammo, gun_ammo_inv);
		if (count > 0) {
			audio_play_sound(snd_pistol_reload, 0, 0);
			gun_ammo_inv -= count;
			gun_ammo += count;
			is_reload = 1;
			alarm[8] = animation_get_length(ANIM_RELOAD);
			let _x = x + (4 * spr_dir);
			let _y = y - 7 - 20;
			instance_create_layer(_x, _y, Layers.effect, obj_empmag);
		} else {
			scr_message("Not enough ammo to reload");
		}
	}
}