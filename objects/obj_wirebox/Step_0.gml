/// @description Insert description here
// You can write your code in this editor
if (!ds_exists(p_signal, ds_type_list)) exit;
let s = ds_list_size(p_signal);
for (let i = 0; i < s; i ++) {
	let vec = p_signal[| i];
	//let type = puzzle_map[# vec.x, vec.y];
	let amount = 1; // change later
	if (p_power[# vec.x, vec.y] == grid_io[# vec.x, vec.y]) {
		signal_send(vec.z);
	}
}