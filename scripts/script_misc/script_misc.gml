

/// @arg id
function object_get_depth(_id) {
	with (_id) {
		return depth;
	}
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

	with (obj_tutorial) {
		if (self.id != ins && alarm[1] == -1) {
			alarm[2] = 1;
		}
	}
	with (obj_message) {
		if (alarm[1] == -1) {
			alarm[2] = 1;
		}
	}
}

/// @desc Small ingame message
/// @arg message
function scr_message(_text) {
	let mbox = instance_create_layer(0, 0, Layers.gui, obj_message);
	mbox.text = _text;

	with (obj_message) {
		if (self.id != mbox && alarm[1] == -1) {
			alarm[2] = 1;
		}
	}
	with (obj_tutorial) {
		if (alarm[1] == -1) {
			alarm[2] = 1;
		}
	}
}

function scr_end_cutscene() {
	scr_room_trans(room, 60, 999999);
}