/// @description Insert description here
// You can write your code in this editor

if (is_branch) {
	exit;	
}

d_line_length = string_length(scene.dialog[d_current]);
d_cur_length = string_length(current_text);

let _text = scene.dialog[d_current];
let _sound = scene.sound[d_current];
let _target = scene.target[d_current];

if (alarm[0] == -1) {
	if ( (keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left) ) && alarm[2] == -1) {
		if (d_cur_length == d_line_length) {
			d_current ++;
			if (d_current >= scene.count) {
				alarm[0] = 30;
				d_current --;
				exit;
			}
			if (is_array(scene.dialog[d_current])) {
				is_branch = 1;
				alarm[2] = d_input_wait;
			}
			alarm[1] = d_appear_spd;
			d_script_exec = 0;
		} else {
			current_text = _text;
			d_char_num = 0;
			alarm[1] = d_appear_spd;
			alarm[2] = d_input_wait;
			audio_stop_sound(_sound);
		}
	}
	
	if (d_script_exec == 0 && alarm[0] == -1 && !is_branch) {
		let _script = scene.escript[d_current];
		if (is_method(_script)) {
			_script();
		} else if (script_exists(_script)) {
			script_execute(_script);
		}
		d_script_exec = 1;
	}

	obj_cam.target = _target;
}