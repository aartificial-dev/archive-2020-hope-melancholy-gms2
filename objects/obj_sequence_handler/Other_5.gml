/// @description Insert description here
// You can write your code in this editor
let size = ds_list_size(seq);

for (let i = 0; i < size; i ++) {
	let effect = seq[| i];
	layer_sequence_destroy(effect);
}
ds_list_destroy(seq);