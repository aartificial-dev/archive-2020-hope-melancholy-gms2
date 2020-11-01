function ds_list_init() {
	obj_cam.ds_amount ++;
	return ds_list_create();
}

/// @arg id
function ds_list_purge(_id) {
	if (ds_exists(_id, ds_type_list)) {
		obj_cam.ds_amount --;
		ds_list_destroy(_id);
	}
}