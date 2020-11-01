/// @description Insert description here
// You can write your code in this editor

if (audio != noone) {
	let _dist = distance_to_object(obj_pl);
	
	if (!audio_is_playing(_id) && _dist <= faloff) {
		_id = audio_play_at(audio, x, y, faloff, 1, 1, 0);
	}
	if (audio_is_playing(_id) && _dist > faloff) {
		audio_stop_sound(_id);
	}
	if (audio_is_playing(_id) && _dist <= faloff) {
		audio_gain(_id, faloff);
	}
}