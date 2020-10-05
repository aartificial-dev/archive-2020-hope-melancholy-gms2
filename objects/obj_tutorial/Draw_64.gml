/// @description Insert description here
// You can write your code in this editor

draw_set_font_ext(fnt_pixel, fa_center, fa_top);

let _y;
let _w = string_width(text) + 10;
let _h = string_height(text);
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


draw_rect_f(_x, _y, _x + _w, _y + _h, c_black, 0, 0.6 * alpha);
draw_set_alpha(alpha);
draw_text(_x + _w / 2, _y + 3, text);
draw_set_alpha(1);

if (keyboard_check_pressed(key) || mouse_check_button_pressed(mouse)) {
	alarm[1] = 10;
}