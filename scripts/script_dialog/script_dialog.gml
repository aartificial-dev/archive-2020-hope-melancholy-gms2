/// @desc Creates dialog object and passes Dialog struct into it
/// @arg dialog_obj
function scr_dialog(_obj) {
	let _dia = _obj;
	if (is_array(_obj)) {
		_dia = _obj[0];
	}
	
	if (instanceof(_dia) != "Dialog") {
		console_log("Cannot set dialog.");
		return;
	}
	let dbox = instance_create_layer(0, 0, Layers.gui, obj_dialog);
	dbox.scene = _dia;
}


function scr_dialog_camshake() {
	scr_camera_shake(cam_shake.both, 10, 120);
}

/// @arg file_prefix
/// @arg section
function scr_dialog_init(_pref, _section) {
	return new Dialog(_pref, _section);	
}

/// @arg dialog
/// @arg key
/// @arg target
/// @arg sound
/// @arg script
function scr_dialog_add_line(_obj, _text, _target, _sound, _script) {
	///
	_obj.add(_text, _target, _sound, _script);
}

/// @arg dialog
/// @arg key1
/// @arg key2
/// @arg target
/// @arg sound
/// @arg next_dialog1
/// @arg next_dialog2
function scr_dialog_add_answer2(_obj, _text1, _text2, _target, _sound, _newd1, _newd2) {
	_obj.add([_text1, _text2], _target, _sound, [_newd1, _newd2]);
}

/// @arg dialog
/// @arg key1
/// @arg key2
/// @arg key3
/// @arg target
/// @arg sound
/// @arg next_dialog1
/// @arg next_dialog2
/// @arg next_dialog3
function scr_dialog_add_answer3(_obj, _text1, _text2, _text3, _target, _sound, _newd1, _newd2, _newd3) {
	_obj.add([_text1, _text2, _text3], _target, _sound, [_newd1, _newd2, _newd3]);	
}

/// @arg dialog
/// @arg script
function scr_dialog_add_end_script(_obj, _script) {
	_obj.endscript = _script;
}


