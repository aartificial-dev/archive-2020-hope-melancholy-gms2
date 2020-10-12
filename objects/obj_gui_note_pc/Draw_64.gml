/// @description Insert description here
// You can write your code in this editor

/// 103 18 // 9 sep 117 w
/// 221 3 /// 229 11

draw_set_font_ext(fnt_pixel, fa_left, fa_top);

if (!checked) exit;

let _fmod = 0;

if (point_in_rectangle(gui_mouse_x, gui_mouse_y, 44, 16, 282, 144)) {
	if (mouse_check_button_pressed(mb_left)) {
		audio_stop_sound(snd_gui_pc_click);
		audio_play_sound(snd_gui_pc_click, 0, 0);
	}
}

draw_sprite(sprite_index, 0, gui_w / 2, 0);
if (point_in_rectangle(gui_mouse_x, gui_mouse_y, 275, 17, 281, 23)) {
	if (mouse_check_button_pressed(mb_left)) {
		instance_destroy();
	}
	draw_sprite(sprite_index, 1, gui_w / 2, 0);
}

let count = note.count;
for (let i = 0; i < count; i ++) {
	draw_sprite(spr_gui_pc_mail, 0, 46, 26 + (14 * i));
	if (point_in_rectangle(gui_mouse_x, gui_mouse_y, 46, 26 + (14 * i), 95, 26 + (14 * i) + 12)) {
		if (mouse_check_button_pressed(mb_left)) {
			mail_current = i;
			checked = 0;
		}
		draw_sprite(spr_gui_pc_mail, 2, 46, 26 + (14 * i));
	}
	if (i == mail_current) {
		draw_sprite(spr_gui_pc_mail, 1, 46, 26 + (14 * i));
	}
	let _t = note.notes[i].from;
	let _h = string_height("QWERTY");
	draw_text_color(48, 27 + (14 * i) + _fmod, _t, c_black, c_black, c_black, c_black, 1);
}
 /// 280 51 /// 92
let _lh = 91 / array_length(pages);
let _ly = 51 + (_lh * page_current)
let _lx = 280;
draw_rectangle_color(_lx - 1, _ly, _lx, _ly + _lh, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
if (mouse_wheel_up()) {
	page_current --;
}
if (mouse_wheel_down()) {
	page_current ++;
}

page_current = clamp(page_current, 0, array_length(pages) - 1);

/// 47 27
let _h = string_height("QWERTY");
let _text = pages[page_current];
draw_text_ext_color(99, 51 + _fmod, _text, _h, 270, c_black, c_black, c_black, c_black, 1);

draw_text_color(99, 26 + _fmod, "From: " + string(from), c_black, c_black, c_black, c_black, 1);
draw_text_color(99, 38 + _fmod, "To: " + string(to), c_black, c_black, c_black, c_black, 1);