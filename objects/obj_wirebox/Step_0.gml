/// @description Insert description here
// You can write your code in this editor
if (!ds_exists(p_signal, ds_type_list)) exit;

let play = 0;

let s = ds_list_size(p_signal);
for (let i = 0; i < s; i ++) {
	let vec = p_signal[| i];
	if (p_power[# vec.x, vec.y] == grid_io[# vec.x, vec.y]) {
		signal_send(vec.z);
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