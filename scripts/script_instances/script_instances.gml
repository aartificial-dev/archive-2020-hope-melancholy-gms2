
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