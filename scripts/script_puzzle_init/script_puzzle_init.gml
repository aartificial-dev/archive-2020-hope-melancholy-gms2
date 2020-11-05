/// @arg cell_amount
function scr_puzzle_init() {
	puzzle_map = ds_grid_create(10, 10);
	ds_grid_clear(puzzle_map, noone);
}

/// @arg x
/// @arg y
/// @arg amount
/// @arg output_signal
/// @arg overload_signal
function scr_puzzle_add_input(_x, _y, _amount, _signal, _over) {	
	puzzle_map[# _x, _y] = new PuzzleCell(puzzle_node.n_input, 0, _amount, _signal, _over);
}

/// @arg x
/// @arg y
/// @arg amount
function scr_puzzle_add_power(_x, _y, _amount) {
	puzzle_map[# _x, _y] = new PuzzleCell(puzzle_node.n_power, _amount, 9999, noone, noone);
}

/// @arg x
/// @arg y
/// @arg type
function scr_puzzle_add_block(_x, _y, _type) {
	puzzle_map[# _x, _y] = new PuzzleCell(_type, 0, 9999, noone, noone);
}

/// @arg x
/// @arg y
/// @arg xto
/// @arg yto
function scr_puzzle_add_connection(_x, _y, xto, yto) {
	let cell = puzzle_map[# _x, _y];
	if (cell != noone) {
		cell.connect_def = new Vec2(xto, yto);
		scr_puzzle_reset();
	} else {
		console_log("Puzzle connection failed. Empty cell at [" + string(_x) + "," + string(_y) + "].");
	}
}

/// @func scr_puzzle_reset
/// @desc resets connections to default
function scr_puzzle_reset() {
	for (let _y = 0; _y < 10; _y ++) {
		for (let _x = 0; _x < 10; _x ++) {
			let cell = puzzle_map[# _x, _y];
			if (cell != noone) {
				cell.connect = cell.connect_def;	
			}
		}
	}
	con_mouse = noone;
}

enum puzzle_node {
	n_power, n_input, n_transit, n_block, n_breaker, n_multiplier, n_divider
}