/// @description Insert description here
// You can write your code in this editor

if (alarm[0] == -1) {
	var sound = snd_pl_whoosh;
	var list = ds_list_init();
	var num = instance_place_list(x, y, par_collision, list, 0);
	if (num) {
		for (var i = 0; i < ds_list_size(list); i ++) {
			let ins = list[| i];
			if (ins == creator) {continue;}
			if (obj_is_ancestor(ins, par_obsticle)) {continue;}
			ins.hit_object_x = creator.x; 
			ins.hit_object_y = y;
			ins.hit_object_dmod = 1;
			with (ins) {
				event_user(15);
			}
			sound = snd_pl_punch;
		}
	}
	audio_play_at(sound, x, y, 150, 1, 0, 0);
	ds_list_purge(list);
	alarm[0] = 10;
}