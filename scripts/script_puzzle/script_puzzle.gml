/// @desc get x coord on gui
/// @arg x
function scr_puzzle_x(_x) {
		let left = (gui_w / 2) - 70 - 1;
		return ( left + (_x * 14) );
}

/// @desc get y coord on gui
/// @arg y
function scr_puzzle_y(_y) {
		let up = (gui_h / 2) - 70 - 1;
		return ( up + (_y * 14) );
}

/// @func scr_puzzle_block
/// @desc creates blocks for puzzle collisions
function scr_puzzle_block() {
	cell_size = 14;
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			if (puzzle_map[# _x, _y] != noone) {
				let _l = scr_puzzle_x(_x);
				let _u = scr_puzzle_y(_y);
				let block = instance_create_layer(_l, _u, Layers.gui, obj_puzzle_block);
				block.image_xscale = cell_size;
				block.image_yscale = cell_size;
			}
		}
	}
}

/// @arg xto
/// @arg yto
function scr_puzzle_connect(xto, yto) {
	let cell = puzzle_map[# xto, yto];
	if ( (con_mouse.x == xto && con_mouse.y == yto) || cell.type == puzzle_node.n_power || cell.type == puzzle_node.n_breaker) {
		let m_cell = puzzle_map[# con_mouse.x, con_mouse.y];
		m_cell.connect = noone;
		audio_play_sound(snd_puzzle_unplug, 0, 0);
		scr_puzzle_check_connections();
		scr_puzzle_power();
	} else { 
		let x1 = scr_puzzle_x(con_mouse.x) + 7;
		let y1 = scr_puzzle_y(con_mouse.y) + 7;
		let x2 = scr_puzzle_x(xto) + 7;
		let y2 = scr_puzzle_y(yto) + 7;
		scr_puzzle_deactivate_blocks(con_mouse.x, con_mouse.y, xto, yto);
		
		let _line = collision_line(x1, y1, x2, y2, obj_puzzle_block, 0, 1);
		if (!_line) {
			let m_cell = puzzle_map[# con_mouse.x, con_mouse.y];
			m_cell.connect = new vec2(xto, yto);
			audio_play_sound(snd_puzzle_plug, 0, 0);
		} else {
			audio_play_sound(snd_puzzle_unplug, 0, 0);
		}
		instance_activate_all();
	}
	con_mouse = noone;
	scr_puzzle_check_connections();
	scr_puzzle_power();
}

function scr_puzzle_check_connections() {
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				cell.active = true;
			}
		}
	}
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				if (cell.type == puzzle_node.n_breaker && cell.connect != noone) {
					let m_cell = puzzle_map[# cell.connect.x, cell.connect.y];
					m_cell.active = false;
				}
			}
		}
	}
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				if (cell.connect != noone) {
					let m_cell = puzzle_map[# cell.connect.x, cell.connect.y];
					if (cell.active == false || (m_cell.active == false && cell.type != puzzle_node.n_breaker)) {
						cell.connect = noone;
						continue;
					}
					let x1 = scr_puzzle_x(_x) + 7;
					let y1 = scr_puzzle_y(_y) + 7;
					let x2 = scr_puzzle_x(cell.connect.x) + 7;
					let y2 = scr_puzzle_y(cell.connect.y) + 7;
					scr_puzzle_deactivate_blocks(_x, _y, cell.connect.x, cell.connect.y);
					let _line = collision_line(x1, y1, x2, y2, obj_puzzle_block, 0, 1);
					if (_line) {
						cell.connect = noone;
					}
				}
				instance_activate_all();
			}
		}
	}
}

function scr_puzzle_deactivate_blocks(xfr, yfr, xto, yto) {
	let b1 = collision_point(scr_puzzle_x(xfr) + 7, scr_puzzle_y(yfr) + 7, obj_puzzle_block, 0, 0);
	let b2 = collision_point(scr_puzzle_x(xto) + 7, scr_puzzle_y(yto) + 7, obj_puzzle_block, 0, 0);
	instance_deactivate_object(b1);
	instance_deactivate_object(b2);
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				if (cell.active == 0) {
					let _block = collision_point(scr_puzzle_x(_x) + 7, scr_puzzle_y(_y) + 7, obj_puzzle_block, 0, 0);
					instance_deactivate_object(_block);
				}
			}
		}
	}
}

function scr_puzzle_draw_connections() {
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				if (cell.connect != noone) {
					let x1 = scr_puzzle_x(_x) + 7;
					let y1 = scr_puzzle_y(_y) + 7;
					let x2 = scr_puzzle_x(cell.connect.x) + 7;
					let y2 = scr_puzzle_y(cell.connect.y) + 7;
					draw_line_width_color(x1 - 4, y1, x2 + 4, y2, 2, c_blue, c_red);
				}
			}
		}
	}
	if (con_mouse != noone) {
		let _x = scr_puzzle_x(con_mouse.x) + 7;
		let _y = scr_puzzle_y(con_mouse.y) + 7;
		draw_line_width_color(_x - 4, _y, gui_mouse_x, gui_mouse_y, 2, c_blue, c_red);
	}
}

function scr_puzzle_power() {
	let ds_power = ds_list_init();
	let ds_input = ds_list_init();
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				cell.cur_power = 0;
				if (cell.type = puzzle_node.n_input) {
					ds_list_add(ds_input, new vec2(_x, _y));
				}
				if (cell.type = puzzle_node.n_power) {
					ds_list_add(ds_power, new vec2(_x, _y));
				}
			}
		}
	}
	
	let p_size = ds_list_size(ds_power);
	for (let i = 0; i < p_size; i ++) {
		let vec = ds_power[| i];
		let _x = vec.x;
		let _y = vec.y;
		let pcell = puzzle_map[# _x, _y];
		let j = 0;
		let _amount = pcell.out_power;
		while (true) {
			let cell = puzzle_map[# _x, _y];
			if (cell.type == puzzle_node.n_multiplier) {
				_amount *= 2;
			}
			if (cell.type == puzzle_node.n_divider) {
				_amount /= 2;
			} 
			cell.cur_power += _amount;
			if (cell.connect == noone) {break;}
			_x = cell.connect.x;
			_y = cell.connect.y;
			j ++;
			if (j > 100) {
				audio_play_sound(snd_electro_explode, 0, 0);
				scr_puzzle_reset();
				instance_destroy();
			}
		}
	}
	// check for overload
	let play = 0;
	let i_size = ds_list_size(ds_input);
	for (let i = 0; i < i_size; i ++) {
		let vec = ds_input[| i];
		let cell = puzzle_map[# vec.x, vec.y];
		if (cell.cur_power > cell.max_power) {
			play = 1;
			signal_send(cell.signal_overload);
		}
	}
	if (play == 1) {
		audio_play_sound(snd_electro_explode, 0, 0);
		scr_puzzle_reset();
		instance_destroy();
	}
	ds_list_purge(ds_power);
	ds_list_purge(ds_input);
}

/// @arg cell
function scr_puzzle_sprite(cell) {
	let col = spr_puzzle_block;
	switch (cell) {
		case puzzle_node.n_block:
			col = spr_puzzle_block;
		break;
		case puzzle_node.n_input:
			col = spr_puzzle_input;
		break;
		case puzzle_node.n_power:
			col = spr_puzzle_power;
		break;
		case puzzle_node.n_transit:
			col = spr_puzzle_transit;
		break;
		case puzzle_node.n_breaker:
			col = spr_puzzle_breaker;
		break;
		case puzzle_node.n_multiplier:
			col = spr_puzzle_multiplier;
		break;
		case puzzle_node.n_divider:
			col = spr_puzzle_divider;
		break;
	}
	return col;
}