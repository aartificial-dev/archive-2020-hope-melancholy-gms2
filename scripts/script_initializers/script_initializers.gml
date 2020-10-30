
/// @arg function
/// @arg signal
/// @arg is_constant
function scr_receiver_init(_func, _signal, _constant) {
	func = _func;
	signal = _signal;
	constant = _constant;
}

/// @arg room
/// @arg door_id
/// @arg dest_id
function scr_door_init(_room, _id, _dest) {
	target_room = _room; // room ind to goto
	target = _dest;	// id of pl_marker to goto
	
	let _y = y + sprite_height - sprite_yoffset;
	let marker = instance_create_layer(x, _y, Layers.system, obj_pl_marker);
	marker.mid = _id; // id of this door's marker (marker id)
	marker.door = id;
}

/// @arg room
/// @arg door_id
/// @arg dest_id
/// @arg signal
function scr_door_signal_init(_room, _id, _dest, _signal) {
	target_room = _room; // room ind to goto
	target = _dest;	// id of pl_marker to goto
	signal = _signal; // signal of door opens
	
	let _y = y + sprite_height - sprite_yoffset;
	let marker = instance_create_layer(x, _y, Layers.system, obj_pl_marker);
	marker.mid = _id; // id of this door's marker (marker id)
	marker.door = id;
}

/// @arg signal
/// @arg key_id
function scr_keycard_lock_init(_signal, _key) {
	signal = _signal;
	key = _key;
}

/// @arg signal
/// @arg 4digit_key
function scr_keypad_init(_signal, _key) {
	signal = _signal;
	key = _key;
}