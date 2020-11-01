/// @description Insert description here
// You can write your code in this editor
alpha = 0;
alarm[0] = 10;

if (audio_is_playing(snd_tutorial)) {
	audio_stop_sound(snd_tutorial);
}
audio_play_sound(snd_tutorial, 0, 0);