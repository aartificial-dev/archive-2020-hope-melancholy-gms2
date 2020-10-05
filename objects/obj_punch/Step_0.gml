/// @description Insert description here
// You can write your code in this editor

if (alarm[0] == -1) {
	var sound = snd_pl_whoosh;
	var list = ds_list_create();
	var num = collision_line_list(x, y, stx, sty, par_collision, 0, 1, list, 0);
	if (num) {
		for (var i = 0; i < ds_list_size(list); i ++) {
			if (list[| i] == creator) {continue;}
			if (obj_is_ancestor(list[| i], par_obsticle)) {continue;}
			with (list[| i]) {
				hit_object_x = other.stx; 
				hit_object_y = other.sty;
				hit_object_dmod = 1;
				event_user(15);
			}
			sound = snd_pl_punch;
		}
	}
	audio_play_at(sound, x, y, 150, 1, 0, 0);
	ds_list_destroy(list);
	alarm[0] = 10;
}