/// @description Insert description here
// You can write your code in this editor


if (obj_cam.show_debug) {
	draw_set_font_ext(fnt_crux, fa_left, fa_top);
	draw_text(x - sprite_width / 2 - view_x, y - view_y, "S: " + string(signal) + "\n" + "A: " + string(active));
}