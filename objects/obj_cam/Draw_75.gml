/// @description Room transitions
// You can write your code in this editor

if (real_in(global.r_trans_state, 1, global.r_trans_spd)) {
	draw_set_alpha(global.r_trans_state / global.r_trans_spd);
	draw_rectangle_color(0, 0, 320, 180, c_black, c_black, c_black, c_black, 0);
}

if (real_in(global.r_trans_state, global.r_trans_spd, global.r_trans_spd * 2)) {
	draw_set_alpha(1 - ((global.r_trans_state - global.r_trans_spd) / global.r_trans_spd));
	draw_rectangle_color(0, 0, 320, 180, c_black, c_black, c_black, c_black, 0);
}

draw_set_alpha(1);

if (global.r_trans_state == global.r_trans_spd) {
	if (global.r_trans_room != room || global.r_trans_obj == noone) {
		room_goto(global.r_trans_room);
	}
	if (global.r_trans_obj == noone) {
		if (instance_exists(target)) {
			instance_destroy(target);
		}
	} else if (instance_exists(target)) {
		target.alarm[6] = 2;
	}
}


if (real_in(global.r_trans_state, 1, global.r_trans_spd * 2)) {
	global.r_trans_state ++;
} else {
	global.r_trans_state = 0;
}
