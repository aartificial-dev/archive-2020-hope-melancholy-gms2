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
		if (!is_attack && !is_reload && !on_ladder) {	spr_dir = sign(mouse_x - x); }
	}
	
	let ladder_b = instance_place(x, y, obj_ladder);
	let ladder_t = instance_place(x, y - 16, obj_ladder);
	if (ladder_b) {
		if (!on_ladder) {
			let key = (ladder_b.object_index == obj_ladder) ? ord("W") : ord("S"); // check which key need to get on ladder
			if (keyboard_check_pressed(key) && abs(x - ladder_b.x) < 4) {	on_ladder = 1; } else {	on_ladder = 0; } // check if can go on ladder
		}
		if (on_ladder && !keyboard_check(ord("W"))) {
			if (keyboard_check(ord("S"))) { // if on ladder && pressing right key
				if ( !instance_place(x, y + 0.5, par_unwalk)) { // if no obsticle at bottom
					y += 0.5;
					if (animation_get_current_sprite() == spr_pl_ladder_u) { animation_set_frame(animation_get_current_number() - animframe); } // swap frames if before goes up
					animation_bind(ANIM_LADDER, spr_pl_ladder_d, 0.05 * 2);
					ladder_im = animframe; ladder_move = 1; // set frame for animation
				} else { on_ladder = 0; ladder_move = 0; } // if obsticle on botton then get out
			} else {ladder_move = 0;} // if key not pressed -> do not move animation
		}
	} else {
		if (keyboard_check(ord("S")) && !keyboard_check(ord("W"))) {	on_ladder = 0; ladder_move = 0;	} // if no ladder and key pressed get out
	}
	if (ladder_t && !keyboard_check(ord("S"))) {
		if (on_ladder) {
			if (keyboard_check(ord("W"))) { // if on ladder and key pressed
				if (!instance_place(x, y - 0.5, par_unwalk)) { // if no obsticle up
					y -= 0.5; 
					if (animation_get_current_sprite() == spr_pl_ladder_d) { animation_set_frame(animation_get_current_number() - animframe); } // swap frames if before goes down
					animation_bind(ANIM_LADDER, spr_pl_ladder_u, 0.05 * 2);
					ladder_im = animframe; ladder_move = 1; // set frame for animation
				} else { ladder_move = 0;	} // if obsticle do not move
			} else { ladder_move = 0; } // if not pressing key do not move
		} else { ladder_move = 0; } // if not on ladder then don't move
	} else {
		if (keyboard_check(ord("W")) && !keyboard_check(ord("S")) ) { on_ladder = 0; ladder_move = 0; } // if no ladder and key pressed get out
	}
	if (on_ladder && keyboard_check(ord("W")) && keyboard_check(ord("S"))) { ladder_move = 0; } // if on ladder and both keys pressed then do not move
	
	if (is_reload || is_hurt || on_ladder) {
		move = 0;
		is_smoke = 0;
		standing_time = 0;
	}
	
	// if item {in hand: block} else if inv open {if mouse {in inv: block} else not}
	let _inv_check = inv_hand ? false : (inv_open ? gui_mouse_y > inv_mheight : true);
	if (mouse_check_button_pressed(mb_left) && keyboard_check(vk_shift) && !is_attack && !is_reload && !on_ladder && _inv_check) {
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
	
	if (keyboard_check_pressed(ord("R")) && !is_reload && !is_attack && !on_ladder) {
		scr_pl_reload();
	}
}

scr_pl_lamp();


event_inherited();