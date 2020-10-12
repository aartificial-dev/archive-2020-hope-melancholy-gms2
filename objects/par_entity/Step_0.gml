/// @description Moving
// You can write your code in this editor


/*anim_index += anim_speed;

switch (anim_state) {
	case AnimState.idle: {
		if (move != 0) {anim_state = AnimState.walk; anim_index = 0;}
		anim_speed = s_anim_idle_spd;
		anim_image = s_anim_idle;
	} break;
	case AnimState.walk: {
		if (move == 0) {anim_state = AnimState.idle; anim_index = 0;}
		anim_speed = s_anim_walk_spd;
		anim_image = s_anim_walk;
	} break;
	case AnimState.hit: {
		anim_speed = s_anim_hit_spd;
		anim_image = s_anim_hit;
		move = 0;
	} break;
	case AnimState.die: {
		anim_speed = s_anim_die_spd;
		anim_image = s_anim_die;
		move = 0;
	} break;
	case AnimState.fall: {
		if (v_spd <= 0) {anim_state = AnimState.idle; anim_index = 0;}
		anim_speed = s_anim_fall_spd;
		anim_image = s_anim_fall;
		move = 0;
	}
}

if (anim_index >= sprite_get_number(anim_image)) {
	anim_index = 0;
	if (anim_state == AnimState.hit) {
		anim_state = AnimState.idle;
	}
	if (anim_state == AnimState.die) {
		instance_destroy();
	}
}

*/

if (move != 0) {
	spd += vel;
	spr_dir = move;
} else {
	spd -= vel;
}

v_spd += v_vel;
spd = clamp(spd, 0, mspd);
v_spd = clamp(v_spd, 0, v_mspd);

if (!place_meeting(x + spd * move, y, par_unwalk)) {
	x += spd * move;
} else {
	spd = 0;
}
if (!place_meeting(x, y + v_spd, par_unwalk)) {
//	anim_state = AnimState.fall;
	y += v_spd;
} else {
	v_spd = 0;
}

if (spr_dir == 0) {
	spr_dir = 1;
}

hp = clamp(hp, 0, mhp);