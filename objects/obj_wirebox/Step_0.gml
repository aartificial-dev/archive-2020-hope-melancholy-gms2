/// @description Insert description here
// You can write your code in this editor
if (!ds_exists(puzzle_map, ds_type_grid)) {
	exit;
}
if (!ds_exists(puzzle_input, ds_type_list)) {
	puzzle_input = ds_list_create();
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				if (cell.type = puzzle_node.n_input) {
					ds_list_add(puzzle_input, new vec2(_x, _y));
				}
			}
		}
	}
}

let play = 0;

let s = ds_list_size(puzzle_input);
for (let i = 0; i < s; i ++) {
	let vec = puzzle_input[| i];
	let cell = puzzle_map[# vec.x, vec.y];
	if (cell.cur_power == cell.max_power) {
		signal_send(cell.signal);
		play = 1;
	}
}

if (play && !collision_line(x, y, obj_pl.x, obj_pl.y - 20, par_unwalk, 0, 1)) {
	if (!audio_is_playing(__sound_id)) {
		__sound_id = audio_play_at(snd_wirebox_bzz, x, y, 100, 1, 1, 0);
	}
} else {
	if (audio_is_playing(__sound_id)) {
		audio_stop_sound(__sound_id);
	}
}