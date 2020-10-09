/// @description Insert description here
// You can write your code in this editor

if (ds_exists(puzzle_map, ds_type_grid)) {
	ds_grid_destroy(puzzle_map);
}
if (ds_exists(puzzle_input, ds_type_list)) {
	ds_list_destroy(puzzle_input);
}