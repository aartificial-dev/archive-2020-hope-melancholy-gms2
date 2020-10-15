/// @description Moving
// You can write your code in this editor

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