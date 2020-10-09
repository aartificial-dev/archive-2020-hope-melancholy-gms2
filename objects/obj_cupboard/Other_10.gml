/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (item != noone) {
	scr_item_summon(item, x, y - 20);
	item = noone;
}
// sound
if (image_index == 0) {
	audio_play_at(snd_drawer_open, x, y, 150, 1, 0, 0);
} else {
	audio_play_at(snd_drawer_close, x, y, 150, 1, 0, 0);
}
image_index = 1 - image_index;
