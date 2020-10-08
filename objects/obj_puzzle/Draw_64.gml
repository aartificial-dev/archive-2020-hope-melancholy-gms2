/// @description Insert description here
// You can write your code in this editor

if (block_init = 0) {
	scr_puzzle_block();
	block_init = 1;
}

// draw_rect_f(left - 5, up - 5, right + 5, down + 5, c_gray, 0, 1);
//draw_rect_f(left, up, right, down, c_white, 0, 1);
draw_sprite(spr_puzzle, 0, gui_w / 2, gui_h / 2);

//let grid_size = 10;
let cell_size = 140 / grid_size;
let left = (gui_w / 2) - 70 - 1;
let right = (gui_w / 2) + 70 - 1;
let up = (gui_h / 2) - 70 - 1;


if (puzzle_map != noone) {
	if (keyboard_check_pressed(ord("R"))) {
		scr_puzzle_reset();
	}
	scr_puzzle_check_connections();
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			let _l = left + (_x * cell_size);
			let _u = up + (_y * cell_size);
			if ( (_x + _y) % 2 == 0) {
				draw_rect_f(_l + 1, _u + 1, _l + cell_size, _u + cell_size, c_dkgray, 0, 0.25);
			}
			let cell = puzzle_map[# _x, _y];
			// drawing cells
			if (cell != noone) {
				let _spr = scr_puzzle_sprite(cell);
				let _alpha = grid_active[# _x, _y] ? 1: 0.5;
				draw_sprite_ext(_spr, 0, _l + 1, _u + 1, 1, 1, 0, c_white, _alpha);
				// connections make
				if (point_in_rectangle(gui_mouse_x, gui_mouse_y, _l + 1, _u + 1, _l + cell_size, _u + cell_size)) {
					if (mouse_check_button_pressed(mb_left) && cell != puzzle_node.n_block && grid_active[# _x, _y]) {
						if (con_mouse == noone && cell != puzzle_node.n_input) {
							con_mouse = new vec2(_x, _y);
							connections[# _x, _y] = noone;
							audio_play_sound(snd_puzzle_take, 0, 0);
						} else if (con_mouse != noone) {
							scr_puzzle_connect(_x, _y);
						}
					}
				}
			} else {
				let _l = left + (_x * cell_size);
				let _u = up + (_y * cell_size);
				if (point_in_rectangle(gui_mouse_x, gui_mouse_y, _l + 1, _u + 1, _l + cell_size, _u + cell_size)) {
					if (mouse_check_button_pressed(mb_left) && con_mouse != noone) {
						audio_play_sound(snd_puzzle_unplug, 0, 0);
						con_mouse = noone;
					}
				}
			}
			// draw connections
			
			// endof for
		}
	}
	scr_puzzle_draw_connections();
	
	/// drawing label
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			let cell = puzzle_map[# _x, _y];
			let _l = left + (_x * cell_size);
			let _u = up + (_y * cell_size);
			// drawing cells
			if (point_in_rectangle(gui_mouse_x, gui_mouse_y, _l + 1, _u + 1, _l + cell_size, _u + cell_size) && cell != noone && cell != puzzle_node.n_block && cell != puzzle_node.n_breaker) {
				let _text = "";
				if (cell == puzzle_node.n_power) { _text = string(grid_io[# _x, _y]); }	else 
				if (cell == puzzle_node.n_input) { _text = string(p_power[# _x, _y]) + "/" + string(grid_io[# _x, _y]);	} else {
					 _text = string(p_power[# _x, _y]);
				}
				draw_set_font_ext(fnt_pixel, fa_left, fa_top);
				let _w = string_width(_text) + 4;
				let _h = string_height(_text);
				draw_rect_f(gui_mouse_x + 10, gui_mouse_y , gui_mouse_x + 10 + _w, gui_mouse_y  + _h, c_black, 0, 0.6);
				draw_text(gui_mouse_x + 10 + 2, gui_mouse_y + 4, _text);
			}
		}
	}
}
// grid_size = 10;
// puzzle_map = noone; // ds_grid[# x, y]
// puzzlemap here
// con_mouse // ds_grid[# x, y]


if (point_in_rectangle(gui_mouse_x, gui_mouse_y, right, up - 5, right + 5, up)) {
draw_sprite(spr_puzzle, 1, gui_w / 2, gui_h / 2);
	if (mouse_check_button_pressed(mb_left)) {
		audio_play_sound(snd_wirebox_close, 0, 0);
		instance_destroy();
	}
}