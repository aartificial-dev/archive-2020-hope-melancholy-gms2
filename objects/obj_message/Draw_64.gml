/// @description Insert description here
// You can write your code in this editor
surface_set_target(obj_cam.gui_surface);
draw_set_font_ext(fnt_pixel, fa_center, fa_top);

_text = ini_open_read("messages", "GENERAL", text);

let _y;
let _w = string_width(_text) + 10;
let _h = string_height(_text); _h /= 2;
let _x = (gui_w / 2) - (_w / 2);

if (alarm[0] != -1) {
	_y = gui_h - (10 - alarm[0]) / 2 - _h;
	alpha = 1 - (alarm[0] / 10);
} 
if (alarm[1] != -1) {
	_y = gui_h - (alarm[1]) / 2 - _h;
	alpha = alarm[1] / 10;
}
if (alarm[0] == -1 && alarm[1] == -1) {
	alpha = 1;
	_y = gui_h - 5 - _h;
}


draw_rect_f(_x, _y, _x + _w, _y + _h + 6, c_black, 0, 0.6 * alpha);
draw_set_alpha(alpha);
draw_text(_x + _w / 2, _y + 3 - _h + 2, _text);
draw_set_alpha(1);
surface_reset_target();