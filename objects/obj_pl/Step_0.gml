/// @description Move
// You can write your code in this editor

event_inherited();

move = 0;
if (can_move) {
	move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	if (keyboard_check_pressed(vk_tab)) {
		inv_open = !inv_open;
	}
	if (mouse_wheel_up() || mouse_wheel_down()) {
		weap_select = 1 - weap_select;
	}
	
	if (keyboard_check(vk_shift)) {
		// DO PREPARE
		move = 0;
		anim_state = AnimState.custom;
		is_smoke = 0;
		standing_time = 0;
		if (!is_attack) {	spr_dir = sign(mouse_x - x); }
	} else if (anim_state == AnimState.custom && !is_attack && !is_smoke) {
		anim_state = AnimState.idle;
	}
	
	// if item {in hand: block} else if inv open {if mouse {in inv: block} else not}
	let _inv_check = inv_hand ? false : (inv_open ? gui_mouse_y > inv_mheight : true);
	if (mouse_check_button_pressed(mb_left) && keyboard_check(vk_shift) && !is_attack && _inv_check) {
		// SHOOT or PUNCH
		is_attack = 1;
		anim_state = AnimState.custom;
		a_image_index += 0.1;
		if (weap_current == "Firearm") {
			scr_attack_shoot();
		}
	} else if (!is_attack) {
		let _x = x + ((- 4) * spr_dir);
		let _y = y - 7 - 24;
		weap_ang = point_direction(_x, _y, mouse_x, mouse_y);
	}
	
	if (keyboard_check_pressed(ord("R"))) {
		// DO RELOAD
		let sound = choose(snd_pistol_cock_1, snd_pistol_cock_2, snd_pistol_cock_3);
		let count = min(gun_ammo_max - gun_ammo, gun_ammo_inv);
		if (count > 0) {
			audio_play_sound(sound, 0, 0);
			gun_ammo_inv -= count;
			gun_ammo += count;
		}
	}
} else {
	anim_state = AnimState.idle;
}