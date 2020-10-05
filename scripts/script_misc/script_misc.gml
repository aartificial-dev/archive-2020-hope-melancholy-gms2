/// @arg soundid
/// @arg x
/// @arg y
/// @arg falloff=150
/// @arg factor=1
/// @arg loop
/// @arg priority
function audio_play_at(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	let soundid = argument0;
	let _x = argument1;
	let _y = argument2;
	let falloff = argument3;
	let factor = argument4;
	let loop = argument5;
	let priority = argument6;
	audio_falloff_set_model(audio_falloff_exponent_distance);
	return audio_play_sound_at(soundid, _x, _y, 0, falloff/2, falloff, factor, loop, priority);
}

/// @arg x
/// @arg y
/// @arg obj
/// @arg prec
/// @arg notme
function collision_point_depth(_x, _y, _obj, _prec, _notme) {
	let list = ds_list_create();
	let col = collision_point_list(_x, _y, _obj, _prec, _notme, list, 0);
	let dep = 100000;
	let _id = noone;
	for (let i = 0; i < col; i ++) {
		let d = object_get_depth(list[| i]);
		if (d < dep) {
			dep = d;
			_id = list[| i];
		}
	}
	ds_list_destroy(list);
	return _id;
}



/// @arg id
function object_get_depth(_id) {
	with (_id) {
		return depth;
	}
}

enum note_type {
	book,
	note,
	news
}

/// @arg text
/// @arg note_type
function scr_note(_text, _type) {
	let note = instance_create_layer(0, 0, Layers.gui, obj_note);
	note.text = _text;
	note.type = _type;
}

/// @arg [text_keyboardkey_mousekey] 
function scr_tutorial(arg) {
	with (obj_tutorial) {
		alarm[1] = 10;
	}
	let ins = instance_create_layer(0, 0, Layers.gui, obj_tutorial);
	ins.text = arg[0];
	ins.key = arg[1];
	ins.mouse = arg[2];
}

/// @arg object
/// @arg parent
function obj_is_ancestor(obj, par) {
	let obj_ind = object_get_index(obj);
	return object_is_ancestor(obj_ind, par);
}

/// @arg object
function object_get_index(obj) {
	with (obj) {
		return object_index;
	}
}


/// @arg [objects]
/// @arg should_all_exist
function instances_exists(arr, all_ex) {
	let s = array_length(arr);
	for (let i = 0; i < s; i ++) {
		if (!instance_exists(arr[i]) && all_ex) {
			return false;
		}
		if (instance_exists(arr[i]) && !all_ex) {
			return true;
		}
	}
	return (all_ex ? true : false);
}