/// @description Move
// You can write your code in this editor

let animstate = animation_get_current_state();
let animframe = animation_get_frame();
let cur_weap = weap_select ? inv_weap2 : inv_weap1;

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
	if (is_reload || is_hurt) {
		move = 0;
		is_smoke = 0;
		standing_time = 0;
	}
	if (weap_current == "Flashlight") {
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
		} else if (weap_current != "Flashlight") {
			is_attack = 1;
			let state = scr_pl_weapon_state(weap_current);
			alarm[8] = animation_get_length(state);
		}
	} else if (!is_attack && !is_reload) {
		let _x = x + ((- 4) * spr_dir);
		let _y = y - 7 - 24;
		weap_ang = point_direction(_x, _y, mouse_x, mouse_y);
	}
	if (is_attack) {
		let im_index = animation_get_frame();
		if (ceil(im_index) == 3) {
			if (weap_current == "Tube") {
				scr_attack_swoosh(x, y - 24);
			}
			if (weap_current == "noone") {
				scr_attack_punch(x, y - 24);
			}
		}
	}
	
	if (!is_reload &&	weap_current == "Flashlight" && inv_item_modif(cur_weap, 0, 0) > 0) {
		if (mouse_check_button_pressed(mb_left) && alarm[5] == -1) {
			flash_on = !flash_on;
			audio_play_sound(snd_flash_toggle, 0, 0);
			alarm[5] = 10;
		}
		if (flash_on) {
			inv_item_modif(cur_weap, 0, -0.005);
			let _an_fix = 0;
			let _ind = floor(animframe);
			if (animstate == ANIM_IDLE) {
				_an_fix = (_ind == 2) ? 1 : 0;
			}
			if (animstate == ANIM_WALK) {
				_an_fix = (_ind == 1 || _ind == 5) ? 1 : ((_ind == 3 || _ind == 7) ? -1 : 0);
			}
			let _x = x + (10 * spr_dir);
			let _y = y - 23 - _an_fix;
			if (!instance_exists(flash_light)) {
				flash_light = instance_create_layer(_x, _y, Layers.light, par_light_flash);
			}
			flash_light.angle = spr_dir ? 0 : 180;
			flash_light.x = _x;
			flash_light.y = _y;
		}
	}
	
	if (keyboard_check_pressed(ord("R")) && !is_reload && !is_attack) {
		scr_pl_reload();
	}
}

if (instance_exists(flash_light) 
		&& (weap_current != "Flashlight"// || can_move == 0
		|| (weap_current == "Flashlight" && inv_item_modif(cur_weap, 0, 0) == 0) || flash_on == 0)) {
	instance_destroy(flash_light);
	flash_on = 0;
	if (alarm[5] == -1) {
		audio_play_sound(snd_flash_toggle, 0, 0);
	}
}


event_inherited();