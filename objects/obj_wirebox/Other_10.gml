/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

let puzzle = instance_create_layer(0, 0, Layers.gui, obj_puzzle);
puzzle.puzzle_map = puzzle_map;
audio_play_sound(snd_wirebox_open, 0, 0);

// write made puzzle