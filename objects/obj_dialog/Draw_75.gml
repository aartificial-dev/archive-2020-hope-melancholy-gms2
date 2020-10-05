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

let xst = width * 0.1;
draw_text_ext(xst, vheight - height + ymod - 2, current_text, lheight, width * 0.8);

if (d_cur_length == d_line_length && alarm[2] == -1) {
	draw_sprite(sprite_index, image_index, width - 15, vheight + ymod - 15);
}