/// @description Insert description here
// You can write your code in this editor

/// 103 18 // 9 sep 117 w
/// 221 3 /// 229 11

draw_set_font_ext(fnt_pixel, fa_left, fa_top);

if (!checked) exit;

switch (type) {
	case note_type.book:
		sprite_index = spr_note_book;
	break;
	case note_type.news:
		sprite_index = spr_note_newspaper;
	break;
	case note_type.pc:
		sprite_index = spr_note_pc;
	break;
	default:
		sprite_index = spr_note;
}
let _fmod = 2;

draw_sprite(sprite_index, 0, gui_w / 2, 0);
if (point_in_rectangle(gui_mouse_x, gui_mouse_y, 221, 3, 229, 11)) {
	if (mouse_check_button_pressed(mb_left)) {
		instance_destroy();
	}
	draw_sprite(sprite_index, 1, gui_w / 2, 0);
}

if (array_length(pages) - 1 > page_current) {
	draw_sprite(sprite_index, 2, gui_w / 2, 0);
	if (point_in_rectangle(gui_mouse_x, gui_mouse_y, 221, 129, 229, 137)) {
		if (mouse_check_button_pressed(mb_left)) {
			page_current ++;
			audio_play_sound(snd_paper_take, 0, 0);
		}
		draw_sprite(sprite_index, 3, gui_w / 2, 0);
	}
}
if (page_current > 0) {
	draw_sprite(sprite_index, 4, gui_w / 2, 0);
	if (point_in_rectangle(gui_mouse_x, gui_mouse_y, 91, 129, 99, 137)) {
		if (mouse_check_button_pressed(mb_left)) {
			page_current --;
			audio_play_sound(snd_paper_take, 0, 0);
		}
		draw_sprite(sprite_index, 5, gui_w / 2, 0);
	}
}
//draw_set_font_ext(font_pixel, fa_left, fa_top);
draw_text_ext_color(gui_w / 2 - 57, 18 + _fmod, pages[page_current], 9, 117, c_black, c_black, c_black, c_black, 1);
//draw_text(10, 10, string_height_ext(pages[page_current], 9, 117));
///120 max height
//show_debug_message(string_height_ext(pages[page_current], 9, 177));