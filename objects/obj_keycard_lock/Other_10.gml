/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!active) {
	scr_message("I need keycard");
} else {
	scr_message("It's already active");
}