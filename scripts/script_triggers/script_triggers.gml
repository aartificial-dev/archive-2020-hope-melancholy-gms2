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

/// @arg function
/// @arg timer
function scr_set_timer(_func, _timer) {
	let ins = instance_create_layer(0, 0, Layers.system, obj_timer);
	ins.alarm[0] = _timer;
	ins.func = _func;
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

/// @arg time
/// @arg script
/// @arg is_fade_id
function scr_create_fadeout(_time, _scr, _fade_in) {
	let ins = instance_create_layer(0, 0, Layers.system, obj_fadeout);
	ins.alarm[0] = _time;
	ins.alarm_max = _time;
	ins.al_script = _scr;
	ins.is_fade_in = _fade_in;
}
