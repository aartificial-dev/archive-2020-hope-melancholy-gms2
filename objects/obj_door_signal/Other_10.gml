/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (signal_get(signal)) {
	scr_room_trans(target_room, 60, target);
	audio_play_sound(door_sound, 0, 0);
} else {
	scr_message(error, obj_pl);
}