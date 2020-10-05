/// @description Draw player

// Inherit the parent event
event_inherited();

///custom here
if (anim_state == AnimState.custom) {
	if (is_attack || keyboard_check(vk_shift)) {
		if (weap_current == "Firearm") {
			//shoot
			let _x = x + ((- 4) * spr_dir);
			let _y = y - 7 - 24;
			let dir = weap_ang;
			let _flip; if (dir > 90 && dir < 270) {_flip = -1;} else {_flip = 1;}
			//angle
			//x and y magic numbers
			draw_sprite_ext(spr_pl_shoot_hands_back, a_image_index, _x, _y, 1, _flip, dir, c_white, 1);
			draw_sprite_ext(spr_pl_shoot, a_image_index, x, y, spr_dir, 1, 0, c_white, 1);
			draw_sprite_ext(spr_pl_shoot_hands_front, a_image_index, _x, _y, 1, _flip, dir, c_white, 1);
		} else if (weap_current == "Tube") {
			//hit
			draw_sprite_ext(spr_pl_tube, a_image_index, x, y, spr_dir, 1, 0, c_white, 1);
		} else {
			//punch
			draw_sprite_ext(spr_pl_punch, a_image_index, x, y, spr_dir, 1, 0, c_white, 1);
		}
	} else if (is_smoke) {
			draw_sprite_ext(spr_pl_smoke, a_smoke_index, x, y, spr_dir, 1, 0, c_white, 1);
	} else {
		
	}
}
