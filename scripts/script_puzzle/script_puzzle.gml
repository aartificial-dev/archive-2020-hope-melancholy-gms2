enum puzzle_node {
	n_power, n_input, n_transit, n_block, n_breaker, n_multiplier, n_divider
}
/// @arg grid_size
/// @arg puzzle_ds_grid
/// @arg IO_list[x.y.type]
/// @arg signal[x.y.signal]
/// @arg overload
function scr_puzzle(_grid_size, _puzzle_map, _power_list, _signal_list, _overload_list) {
	puzzle_map = _puzzle_map; // ds map of puzzle !clear to noone after create!
	p_list = _power_list; // input nodes first. output second. vec3(x, y, node_type)
	p_signal = _signal_list; // ds_list of vec3(x, y, signal) for output signals
	p_overload = _overload_list; // ds_list(int) for overload signals. should be in same order of io_list
}

/// @arg cell_amount
function scr_puzzle_init(_grid_size) {
	grid_size = _grid_size; // amount of cells on screen
	puzzle_map = ds_grid_create(_grid_size, _grid_size);
	connections = ds_grid_create(_grid_size, _grid_size);
	ext_connections = ds_grid_create(_grid_size, _grid_size);
	p_power = ds_grid_create(_grid_size, _grid_size);
	grid_io = ds_grid_create(_grid_size, _grid_size);
	grid_active = ds_grid_create(_grid_size, _grid_size);
	ds_grid_clear(puzzle_map, noone);
	ds_grid_clear(connections, noone);
	ds_grid_clear(ext_connections, noone);
	ds_grid_clear(p_power, 0);
	ds_grid_clear(grid_io, 0);
	ds_grid_clear(grid_active, 1);
	
	p_list = ds_list_create();
	p_signal = ds_list_create();
	p_overload = ds_list_create();
}

/// @arg x
/// @arg y
/// @arg amount
/// @arg output_signal
/// @arg overload_signal
function scr_puzzle_add_input(_x, _y, _amount, _signal, _over) {
	puzzle_map[# _x, _y] = puzzle_node.n_input;
	grid_io[# _x, _y] = _amount;
	ds_list_add(p_list, new vec3(_x, _y, puzzle_node.n_input));
	ds_list_add(p_signal, new vec3(_x, _y, _signal));
	ds_list_add(p_overload, _over);
}

/// @arg x
/// @arg y
/// @arg amount
function scr_puzzle_add_power(_x, _y, _amount) {
	puzzle_map[# _x, _y] = puzzle_node.n_power;
	grid_io[# _x, _y] = _amount;
	ds_list_add(p_list, new vec3(_x, _y, puzzle_node.n_power));
}

/// @arg x
/// @arg y
/// @arg type
function scr_puzzle_add_block(_x, _y, _type) {
	puzzle_map[# _x, _y] = _type;
}

/// @arg x
/// @arg y
/// @arg xto
/// @arg yto
function scr_puzzle_add_connection(_x1, _y1, xto, yto) {
	ext_connections[# _x1, _y1] = new vec2(xto, yto);
	scr_puzzle_reset();
}

function scr_puzzle_reset() {
	ds_grid_clear(connections, noone);
	ds_grid_copy(connections, ext_connections);
}

/// @func scr_puzzle_block
function scr_puzzle_block() {
	let left = (gui_w / 2) - 70 - 1;
	let up = (gui_h / 2) - 70 - 1;
	let cell_size = 140 / grid_size;
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			let cell = puzzle_map[# _x, _y];
			// drawing cells
			if (cell != noone) {
				let _l = left + (_x * cell_size);
				let _u = up + (_y * cell_size);
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
	if (con_mouse.x == xto && con_mouse.y == yto) {
		connections[# con_mouse.x, con_mouse.y] = noone;
		audio_play_sound(snd_puzzle_unplug, 0, 0);
	} else {
		let left = (gui_w / 2) - 70 - 1;
		let up = (gui_h / 2) - 70 - 1;
		let cell_size = 140 / grid_size;
		
		let x1 = left + (con_mouse.x * cell_size) + cell_size / 2;
		let y1 = up + (con_mouse.y * cell_size) + cell_size / 2;
		let x2 = left + (xto * cell_size) + cell_size / 2;
		let y2 = up + (yto * cell_size) + cell_size / 2;
		
		
		scr_puzzle_deactivate_blocks(con_mouse.x, con_mouse.y, xto, yto);
		
		let _line = collision_line(x1, y1, x2, y2, obj_puzzle_block, 0, 1);
		if (!_line) {
			connections[# con_mouse.x, con_mouse.y] = new vec2(xto, yto);
			audio_play_sound(snd_puzzle_plug, 0, 0);
		} else {
			// play bad sound
			audio_play_sound(snd_puzzle_unplug, 0, 0);
		}
		
		instance_activate_all();
	}
	con_mouse = noone;
}

function scr_puzzle_check_connections() {
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			grid_active[# _x, _y] = 1;
		}
	}
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			let cell = puzzle_map[# _x, _y];
			let con = connections[# _x, _y];
			if (cell == puzzle_node.n_breaker && con != noone) {
				grid_active[# con.x, con.y] = 0;
			}
		}
	}
	let left = (gui_w / 2) - 70 - 1;
	let up = (gui_h / 2) - 70 - 1;
	let cell_size = 140 / grid_size;
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			let con = connections[# _x, _y];
			if (connections[# _x, _y] != noone) {
				let x1 = left + (_x * cell_size) + cell_size / 2;
				let y1 = up + (_y * cell_size) + cell_size / 2;
				let x2 = left + (con.x * cell_size) + cell_size / 2;
				let y2 = up + (con.y * cell_size) + cell_size / 2;
				scr_puzzle_deactivate_blocks(_x, _y, con.x, con.y);
				let _line = collision_line(x1, y1, x2, y2, obj_puzzle_block, 0, 1);
				if (_line) {
					connections[# _x, _y] = noone;
				}
				if (!grid_active[# _x, _y]) {
					connections[# _x, _y] = noone;
				}
			}
			instance_activate_all();
		}
	}
}

function scr_puzzle_deactivate_blocks(xfr, yfr, xto, yto) {
	let left = (gui_w / 2) - 70 - 1;
	let up = (gui_h / 2) - 70 - 1;
	let cell_size = 140 / grid_size;
	
	let _l1 = left + (xfr * cell_size) + cell_size / 2;
	let _u1 = up + (yfr * cell_size) + cell_size / 2;
	let _l2 = left + (xto * cell_size) + cell_size / 2;
	let _u2 = up + (yto * cell_size) + cell_size / 2;
	let b1 = collision_point(_l1, _u1, obj_puzzle_block, 0, 0);
	let b2 = collision_point(_l2, _u2, obj_puzzle_block, 0, 0);
	
	instance_deactivate_object(b1);
	instance_deactivate_object(b2);
		
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			if (!grid_active[# _x, _y]) {
				let _ll = left + (_x * cell_size) + cell_size / 2;
				let _uu = up + (_y * cell_size) + cell_size / 2;
				let bb = collision_point(_ll, _uu, obj_puzzle_block, 0, 0);
				instance_deactivate_object(bb);
			}
		}
	}
}

function scr_puzzle_draw_connections() {
	let cell_size = 140 / grid_size;
	let left = (gui_w / 2) - 70 - 1;
	let up = (gui_h / 2) - 70 - 1;
	for (let _y = 0; _y < grid_size; _y ++) {
		for (let _x = 0; _x < grid_size; _x ++) {
			//let cell = puzzle_map[# _x, _y];
			if (connections[# _x, _y] != noone) {
				let vec = connections[# _x, _y];
				let _x1 = left + (_x * cell_size) + cell_size / 2;
				let _y1 = up + (_y * cell_size) + cell_size / 2;
				let _x2 = left + (vec.x * cell_size) + cell_size / 2
				let _y2 = up + (vec.y * cell_size) + cell_size / 2;
				draw_line_width_color(_x1 - cell_size / 4, _y1, _x2 + cell_size / 4, _y2, cell_size / 7, c_blue, c_red);
			}
		}
	}
	if (con_mouse != noone) {
		let _x1 = left + (con_mouse.x * cell_size) + cell_size / 2;
		let _y1 = up + (con_mouse.y * cell_size) + cell_size / 2;
		draw_line_width_color(_x1 - cell_size / 4, _y1, gui_mouse_x, gui_mouse_y, cell_size / 7, c_blue, c_red);
	}
}

function scr_puzzle_power() {
	// p_power - grid of power
	// p_list - list of IO
	ds_grid_clear(p_power, 0);
	let size = ds_list_size(p_list);
	// set power
	for (let i = 0; i < size; i ++) {
		let vec = p_list[| i];
		if (vec.z == puzzle_node.n_input) continue;
		let _x = vec.x; 
		let _y = vec.y; 
		let j = 0;
		let _amount = grid_io[# _x, _y];
		while (true) {
			if (puzzle_map[# _x, _y] == puzzle_node.n_multiplier) {
				_amount *= 2;
			}
			if (puzzle_map[# _x, _y] == puzzle_node.n_divider) {
				_amount /= 2;
			} 
			p_power[# _x, _y] += _amount;
			let next = connections[# _x, _y];
			if (next == noone) break;
			_x = next.x;
			_y = next.y;
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
	for (let i = 0; i < size; i ++) {
		let vec = p_list[| i];
		if (vec.z == puzzle_node.n_power) continue;
		let _x = vec.x;
		let _y = vec.y;
		if (vec.z == puzzle_node.n_input && p_power[# _x, _y] > grid_io[# _x, _y]) {
			play = 1;
			signal_send(p_overload[| i]);
		}
	}
	if (play == 1) {
		audio_play_sound(snd_electro_explode, 0, 0);
		scr_puzzle_reset();
		instance_destroy();
	}
}

/// @arg cell
function scr_puzzle_color(cell) {
	let col = c_gray;
	switch (cell) {
		case puzzle_node.n_block:
			col = c_dkgray;
		break;
		case puzzle_node.n_input:
			col = c_purple;
		break;
		case puzzle_node.n_power:
			col = c_yellow;
		break;
		case puzzle_node.n_transit:
			col = c_green;
		break;
		case puzzle_node.n_breaker:
			col = c_red;
		break;
		case puzzle_node.n_multiplier:
			col = c_orange;
		break;
		case puzzle_node.n_divider:
			col = c_blue;
		break;
	}
	return col;
}