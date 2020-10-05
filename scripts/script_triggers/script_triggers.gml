global.r_trans_spd = 60;
global.r_trans_state = 0;
global.r_trans_room = room_parent;
global.r_trans_obj = noone;

/// @desc 
/// @arg room
/// @arg speed
/// @arg target_obj
function scr_room_trans(_room, _spd, _obj) {
	if (global.r_trans_state) exit;
	global.r_trans_room = _room;
	global.r_trans_spd = _spd;
	global.r_trans_state = 1;
	global.r_trans_obj = _obj;
}

/// @arg function
/// @arg argument[]
/// @arg destroyOnEnd
function scr_trigger_init(_func, _arg, _destroy) {
	trigger = _func;
	arg = _arg;
	destroy = _destroy;
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
}


/// @arg number
function scr_get_marker_id(_id) {
	let _count = instance_number(obj_pl_marker);
	for (let i = 0; i < _count; i ++) {
		let ins = instance_find(obj_pl_marker, i);
		if (ins.mid == _id) {
			return ins;
		}
	}
	
	return noone;
}

function scr_trigger_end_game() {
	game_end();
}

/// @arg room
function scr_trigger_goto_room(room) {
	room_goto(room);
}