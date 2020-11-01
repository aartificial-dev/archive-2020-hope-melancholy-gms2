/// @description Insert description here
// You can write your code in this editor

alarm[0] = 10;
alpha = 0;

if (audio_is_playing(snd_message)) {
	audio_stop_sound(snd_message);
}
audio_play_sound(snd_message, 0, 0);