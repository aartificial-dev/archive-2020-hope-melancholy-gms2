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

