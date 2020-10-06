/// @description Insert description here
// You can write your code in this editor

draw_set_font_ext(fnt_message, fa_left, fa_top);

let alpha = 0.7;
let width = obj_cam.view_width; 
let height = obj_cam.view_height / 6;
let vheight = obj_cam.view_height;
let lheight = string_height("QWERTY");
let ymod = 0;

if (alarm[0] != -1) {
	ymod = (1 - alarm[0] / 30) * height;
}

draw_rect_f(0, -ymod, width, height - ymod, c_black, 0, alpha);
draw_rect_f(0, vheight - height + ymod, width, vheight + ymod, c_black, 0, alpha);

if (is_branch) {
	let _answ = scene.dialog[d_current];
	let size = array_length(_answ);
	let _dist = (obj_cam.view_height - height * 2) / size;
	let _yst = height + _dist / size;
	for (let i = 0; i < size; i++) {
		let xst = width * 0.1;
		let _my = gui_mouse_y * 1.5;
		if (point_in_rectangle(1, _my, 0, _yst + _dist * i, 2, _yst + _dist * i + lheight) && alarm[2] == -1) {
			draw_rect_f(0, _yst + _dist * i, width, _yst + _dist * i + lheight, c_gray, 0, alpha);
			if (mouse_check_button_pressed(mb_left)) {
				let _scenes = scene.escript[d_current];
				scene = _scenes[i];
				event_user(0);
				exit;
			}
		} else {
			draw_rect_f(0, _yst + _dist * i, width, _yst + _dist * i + lheight, c_black, 0, alpha);
		}
		draw_text_ext(xst, _yst + _dist * i, _answ[i], lheight, width * 0.8);
		
		let keyb_key = ord(string(i + 1)); // gets 1 - 3
		if (keyboard_check_pressed(keyb_key)) {
			let _scenes = scene.escript[d_current];
			scene = _scenes[i];
			event_user(0);
			exit;
		}
	}
} else {
	let xst = width * 0.1;
	draw_text_ext(xst, vheight - height + ymod - 2, current_text, lheight, width * 0.8);
}

if (d_cur_length == d_line_length && alarm[2] == -1 && !is_branch) {
	draw_sprite(sprite_index, image_index, width - 15, vheight + ymod - 15);
}