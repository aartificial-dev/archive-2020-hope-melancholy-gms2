/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();


if (x > obj_pl.x) {
	vel += 4;
} else {
	vel -= 4;
} 
audio_play_at(snd_chair_move, x, y, 150, 1, 0, 0);