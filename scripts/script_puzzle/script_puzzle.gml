enum puzzle_node {
	n_power, n_input, n_transit, n_block
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
	p_power = ds_grid_create(_grid_size, _grid_size);
	ds_grid_clear(puzzle_map, noone);
	ds_grid_clear(connections, noone);
	ds_grid_clear(p_power, 0);
	
	p_list = ds_list_create();
	p_signal = ds_list_create();
	p_overload = ds_list_create();
}

/// @arg x
/// @arg y
/// @arg type
/// @arg output_signal
/// @arg overload_signal
function scr_puzzle_add_input(_x, _y, _type, _signal, _over) {
	puzzle_map[# _x, _y] = _type;
	ds_list_add(p_list, new vec3(_x, _y, _type));
	ds_list_add(p_signal, new vec3(_x, _y, _signal));
	ds_list_add(p_overload, _over);
}

/// @arg x
/// @arg y
/// @arg type
function scr_puzzle_add_block(_x, _y, _type) {
	puzzle_map[# _x, _y] = _type;
	if (_type == puzzle_node.n_power) {
		ds_list_add(p_list, new vec3(_x, _y, _type));
	}
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
				if (cell == puzzle_node.n_block) {
					let _l = left + (_x * cell_size);
					let _u = up + (_y * cell_size);
					let block = instance_create_layer(_l, _u, Layers.gui, obj_puzzle_block);
					block.image_xscale = cell_size;
					block.image_yscale = cell_size;
				}
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
		let x1 = left + (con_mouse.x * cell_size);
		let y1 = up + (con_mouse.y * cell_size);
		let x2 = left + (xto * cell_size);
		let y2 = up + (yto * cell_size);
		if (!collision_line(x1, y1, x2, y2, obj_puzzle_block, 0, 1)) {
			connections[# con_mouse.x, con_mouse.y] = new vec2(xto, yto);
			audio_play_sound(snd_puzzle_plug, 0, 0);
		} else {
			// play bad sound
			audio_play_sound(snd_puzzle_unplug, 0, 0);
		}
	}
	con_mouse = noone;
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
		while (true) {
			p_power[# _x, _y] ++;
			let next = connections[# _x, _y];
			if (next == noone) break;
			_x = next.x;
			_y = next.y;
			j ++;
			if (j > 100) {
				audio_play_sound(snd_electro_explode, 0, 0);
				ds_grid_clear(connections, noone);
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
		if (vec.z == puzzle_node.n_input && p_power[# _x, _y] > 1) {
			play = 1;
			signal_send(p_overload[| i]);
		}
	}
	if (play == 1) {
		audio_play_sound(snd_electro_explode, 0, 0);
		ds_grid_clear(connections, noone);
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
	}
	return col;
}