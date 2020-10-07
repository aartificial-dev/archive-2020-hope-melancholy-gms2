/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

let puzzle = instance_create_layer(0, 0, Layers.gui, obj_puzzle);
puzzle.wirebox = id;
puzzle.grid_size = grid_size;
puzzle.puzzle_map = puzzle_map;
puzzle.connections = connections;
puzzle.p_power = p_power;
puzzle.p_list = p_list;
puzzle.p_overload = p_overload;
puzzle.ext_connections = ext_connections;
puzzle.grid_io = grid_io;
puzzle.grid_active = grid_active;
audio_play_sound(snd_wirebox_open, 0, 0);

// write made puzzle