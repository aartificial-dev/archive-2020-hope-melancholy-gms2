/// @description Insert description here
// You can write your code in this editor

let yy = 50;

let alpha = (obj_cam.blur_size / obj_cam.blur_size_m);

draw_set_font_ext(fnt_menu_logo, fa_middle, fa_top);
draw_text_color(gui_w / 2, 10, "h.o.p.e. : melancholy", c_white, c_white, c_white, c_white, alpha);

draw_set_font_ext(fnt_menu_buttons, fa_middle, fa_top);

let names = ["Continue", "Last checkpoint", "Options", "Main menu"];
for (let i = 0; i < 4; i ++) {
	alpha = (obj_cam.blur_size / obj_cam.blur_size_m);
	let strh = string_height("_Last checkpoint_");
	let strw = string_width("_Last checkpoint_") + 1;
	let _y1 = yy + ((strh + 10) * i);
	let _y2 = _y1 + strh;
	let is_in = point_in_rectangle(gui_mouse_x, gui_mouse_y, gui_w / 2 - strw / 2, _y1, gui_w / 2 + strw / 2, _y2);
	let col = is_in ? c_gray : c_white;
	if (!file_exists("save.dat") && i = 1) {
		alpha *= 0.5;;
	}
	draw_rect_f(gui_w / 2 - strw / 2, _y1, gui_w / 2 + strw / 2, _y2, col, 0, alpha * 0.5);
	draw_text_color(gui_w / 2, _y1 + 2, names[i], c_white, c_white, c_white, c_white, alpha);
	if (is_in && mouse_check_button_pressed(mb_left) && alarm[0] == -1 && global.r_trans_state == 0) {
		event_user(i);
		alarm[0] = 120;
	}
}