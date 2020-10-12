/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!active) {
	scr_message("need_keycard");
} else {
	scr_message("mech_active");
}