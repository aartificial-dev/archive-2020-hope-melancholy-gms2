/// @description Insert description here
// You can write your code in this editor

surface_set_target(obj_cam.gui_surface);
if (block_init = 0) {
	scr_puzzle_block();
	block_init = 1;
}
draw_sprite(spr_puzzle, 0, gui_w / 2, gui_h / 2);

let label_x = -1;
let label_y = -1;

if (puzzle_map != noone) {
	if (keyboard_check_pressed(ord("R"))) {
		scr_puzzle_reset();
	}
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let _l = scr_puzzle_x(_x);
			let _u = scr_puzzle_y(_y);
			let cell = puzzle_map[# _x, _y];
			// drawing cells
			if (cell != noone) {
				let _spr = scr_puzzle_sprite(cell.type);
				let _active = cell.active ? 0: 1;
				draw_sprite_ext(_spr, _active, _l + 1, _u + 1, 1, 1, 0, c_white, 1);
				// connections make
				if (point_in_rectangle(gui_mouse_x, gui_mouse_y, _l + 1, _u + 1, _l + 14, _u + 14)) {
					label_x = _x;
					label_y = _y;
					if (mouse_check_button_pressed(mb_left) && cell.type != puzzle_node.n_block && cell.active) {
						if (con_mouse == noone && cell.type != puzzle_node.n_input) {
							con_mouse = new vec2(_x, _y);
							cell.connect = noone;
							scr_puzzle_check_connections();
							audio_play_sound(snd_puzzle_take, 0, 0);
						} else if (con_mouse != noone) {
							scr_puzzle_connect(_x, _y);
						}
					}
				}
			} else {
				if (point_in_rectangle(gui_mouse_x, gui_mouse_y, _l + 1, _u + 1, _l + 14, _u + 14)) {
					if (mouse_check_button_pressed(mb_left) && con_mouse != noone) {
						audio_play_sound(snd_puzzle_unplug, 0, 0);
						con_mouse = noone;
						scr_puzzle_check_connections();
						scr_puzzle_power();
					}
				}
			}
			// draw connections
			
			// endof for
		}
	}
	scr_puzzle_draw_connections();
}

if (label_x != -1 && label_y != -1) {
	let cell = puzzle_map[# label_x, label_y];
	if (cell.type != puzzle_node.n_block && cell.type != puzzle_node.n_breaker) {
		let _text = string(cell.cur_power);
		if (cell.type == puzzle_node.n_power) { _text = string(cell.out_power); }
		if (cell.type == puzzle_node.n_input) { _text = string(cell.cur_power) + "/" + string(cell.max_power); }
		draw_set_font_ext(fnt_pixel, fa_left, fa_top);
		let _w = string_width(_text) + 4;
		let _h = string_height(_text) / 2;
		draw_rect_f(gui_mouse_x + 10, gui_mouse_y , gui_mouse_x + 10 + _w, gui_mouse_y  + _h + 6, c_black, 0, 0.6);
		draw_text(gui_mouse_x + 10 + 2, gui_mouse_y + 4 - _h + 2, _text);
	}
}
	

let right = (gui_w / 2) + 70 - 1;
let up = (gui_h / 2) - 70 - 1;
if (point_in_rectangle(gui_mouse_x, gui_mouse_y, right, up - 5, right + 5, up)) {
draw_sprite(spr_puzzle, 1, gui_w / 2, gui_h / 2);
	if (mouse_check_button_pressed(mb_left)) {
		audio_play_sound(snd_wirebox_close, 0, 0);
		instance_destroy();
	}
}
surface_reset_target();