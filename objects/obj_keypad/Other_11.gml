/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (obj_pl.inv_hand.name == "Keycard") {
	name = "Keypad";
	active = 1;
	audio_play_sound(snd_keypass, 0, 0);
	obj_pl.inv_hand = noone;
}