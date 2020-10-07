/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

let ins = instance_create_layer(0, 0, Layers.gui, obj_gui_keypad);
ins.keypad_key = key;
ins.keypad = id;
ins.active = active;