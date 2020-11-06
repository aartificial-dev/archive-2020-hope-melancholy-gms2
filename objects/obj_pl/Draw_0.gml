/// @description Draw player

// Inherit the parent event
let animstate = animation_get_current_state();
let animframe = animation_get_frame();

let _x = x + ((- 4) * spr_dir);
let _y = y - 7 - 24;
let _flip = (weap_ang > 90 && weap_ang < 270) ? -1 : 1;

if (animstate = ANIM_ATTACK_FIREARM) {
	draw_sprite_ext(spr_pl_shoot_hands_back, animframe, _x, _y, 1, _flip, weap_ang, c_white, 1);
}

event_inherited();

if (animstate = ANIM_ATTACK_FIREARM) {
	draw_sprite_ext(spr_pl_shoot_hands_front, animframe, _x, _y, 1, _flip, weap_ang, c_white, 1);
}

if (animstate == ANIM_SMOKE) {
	draw_sprite_bloom_ext(spr_pl_smoke_bloom, animframe, x, y, spr_dir, 1, 0, c_white, 1);
}

if (animstate == ANIM_WALK || animstate == ANIM_IDLE) {
	if (weap_current == "Firearm") {
		let sprite = (animstate == ANIM_WALK) ? spr_pl_walk_gun : spr_pl_idle_gun;
		draw_sprite_ext(sprite, animframe, x, y, spr_dir, 1, 0, c_white, 1);
	}
	if (weap_current == "Tube") {
		let sprite = (animstate == ANIM_WALK) ? spr_pl_walk_tube : spr_pl_idle_tube;
		draw_sprite_ext(sprite, animframe, x, y, spr_dir, 1, 0, c_white, 1);
	}
	if (weap_current == "Lamp") {
		let sprite = (animstate == ANIM_WALK) ? spr_pl_walk_lamp : spr_pl_idle_lamp;
		draw_sprite_ext(sprite, animframe, x, y, spr_dir, 1, 0, c_white, 1);
	}
	
	if (weap_current == "Flashlight") {
		let sprite_on = (animstate == ANIM_WALK) ? spr_pl_walk_flashlight_on : spr_pl_idle_flashlight_on;
		let sprite_off = (animstate == ANIM_WALK) ? spr_pl_walk_flashlight_off : spr_pl_idle_flashlight_off;
		if (flash_on) {
			draw_sprite_ext(sprite_on, animframe, x, y, spr_dir, 1, 0, c_white, 1);
		} else {
			draw_sprite_ext(sprite_off, animframe, x, y, spr_dir, 1, 0, c_white, 1);
		}
	}

}
