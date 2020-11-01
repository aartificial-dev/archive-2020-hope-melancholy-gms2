/// @description Insert description here
// You can write your code in this editor
if (vel != 0) {
	let can_wheel = 1;
	let list = ds_list_init();
	let num = instance_place_list(x + vel, y - 1, par_collision, list, 0);
	for (let i = 0; i < num; i ++) {
		if (obj_is_ancestor(list[| i], par_unwalk) || obj_is_ancestor(list[| i], par_obsticle)) {
			can_wheel = 0;
		}
	}
	ds_list_purge(list);
	if (can_wheel) {
		x += vel;
		if (impulse) {
			audio_play_at(snd_chair_move, x, y, 150, 1, 0, 0);
			impulse = 0;
		}
	} else {
		vel = 0;
	}
}
vel /= 1.2;
