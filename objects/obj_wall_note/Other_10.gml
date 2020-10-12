/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

let note = instance_create_layer(0, 0, Layers.gui, obj_note);
note.note_file = note_file;
note.note_section = note_section;
note.note_key = note_key;
note.type = note_type.note;