/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (opened) {
	scr_room_trans(target_room, 30, target);
	audio_play_sound(door_sound, 0, 0);
	image_index = 2;
	alarm[0] = 30;
} else {
	scr_message(error);
}
