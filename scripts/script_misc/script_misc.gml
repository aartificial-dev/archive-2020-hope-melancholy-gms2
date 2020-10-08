

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
}

/// @desc Small ingame message
/// @arg message
/// @arg target
function scr_message(_text, _target) {
	let mbox = instance_create_layer(0, 0, Layers.gui, obj_message);
	mbox.text = _text;
	mbox.target = _target;

	with (obj_message) {
		if (self.id != mbox && alarm[1] == -1) {
			alarm[1] = 1;
		}
	}
}

function scr_end_cutscene() {
	scr_room_trans(room, 60, 999999);
}