/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (note = noone) {
	scr_message("It's locked");
} else {
	let _note = instance_create_layer(0, 0, Layers.gui, obj_gui_note_pc);
	_note.note = note;
}