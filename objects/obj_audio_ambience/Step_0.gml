/// @description Insert description here
// You can write your code in this editor
//snd_ambience_creepy_noise

if (audio == noone) {
	instance_destroy();
	exit;
}
if (!audio_is_playing(sound)) {
	sound = audio_play_sound(audio, 10, 1);
	audio_sound_gain(sound, volume, 0);
}
