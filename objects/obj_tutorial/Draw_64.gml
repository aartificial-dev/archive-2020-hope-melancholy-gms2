/// @description Insert description here
// You can write your code in this editor

let _w = string_width(text) + 10;
let _h = string_height(text);
let _x = (gui_w / 2) - (_w / 2);
let _y = gui_h - 20 - _h;

draw_set_font_ext(fnt_pixel, fa_center, fa_middle);
draw_rect_f(_x, _y, _x + _w, _y + _h, c_black, 0, 0.6);
draw_text(_x + _w / 2, _y + _h / 2, text);

if (keyboard_check_pressed(key) || mouse_check_button_pressed(mouse)) {
	instance_destroy();
}