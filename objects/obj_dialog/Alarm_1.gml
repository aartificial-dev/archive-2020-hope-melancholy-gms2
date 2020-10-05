/// @description Add to dialog

let _text = scene.dialog[d_current];
let _sound = scene.sound[d_current];

if (!(d_cur_length == d_line_length)) {
	current_text = string_copy(_text, 1, d_char_num);
	d_char_num ++;
	if (string_length(current_text) == d_line_length) {
		alarm[2] = d_input_wait;
	}
	if (!audio_is_playing(_sound)) {
		audio_play_sound(_sound, 0, 1);
	}
} else {
	d_char_num = 0;
	audio_stop_sound(_sound);
}
alarm[1] = d_appear_spd;