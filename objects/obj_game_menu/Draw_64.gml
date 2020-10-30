/// @description Insert description here
// You can write your code in this editor

let xx = 20;
let yy = 40;

draw_set_font_ext(fnt_pixel, fa_middle, fa_top);
draw_text(gui_w / 2, 10, "h.o.p.e. : melancholy");


let names = ["Continue", "Save", "Load", "Options", "Exit"];
draw_set_font_ext(fnt_pixel, fa_left, fa_top);
for (let i = 0; i < 5; i ++) {
	let strh = string_height("ABCDEFGH");
	let strw = string_width("ABCDEFGH") + 1;
	let _x1 = xx;
	let _y1 = yy + ((strh + 10) * i);
	let _x2 = _x1 + strw;
	let _y2 = _y1 + strh;
	let is_in = point_in_rectangle(gui_mouse_x, gui_mouse_y, _x1, _y1, _x2, _y2);
	let col = is_in ? c_gray : c_white;
	let alpha = (obj_cam.blur_size / obj_cam.blur_size_m);
	draw_rect_f(_x1, _y1, _x2, _y2, col, 0, alpha * 0.5);
	draw_text_color(_x1 + 1, _y1 + 1, names[i], c_white, c_white, c_white, c_white, alpha);
	if (is_in && mouse_check_button_pressed(mb_left)) {
		event_user(i);
	}
}