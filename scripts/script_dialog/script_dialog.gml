/// @desc Creates dialog object and passes Dialog struct into it
/// @arg dialog_obj
function scr_dialog(_obj) {
	let _dia = _obj;
	if (is_array(_obj)) {
		_dia = _obj[0];
	}
	
	if (instanceof(_dia) != "Dialog") {
		show_debug_message("Cannot set dialog.")
		exit;
	}
	let dbox = instance_create_layer(0, 0, Layers.gui, obj_dialog);
	dbox.scene = _dia;
}


function scr_dialog_camshake() {
	scr_camera_shake(cam_shake.both, 10, 120);
}

function scr_dialog_init() {
	return new Dialog();	
}

/// @arg dialog
/// @arg text
/// @arg target
/// @arg sound
/// @arg script
function scr_dialog_add_line(_obj, _text, _target, _sound, _script) {
	///
	_obj.add(_text, _target, _sound, _script);
}

/// @arg dialog
/// @arg text1
/// @arg text2
/// @arg target
/// @arg sound
/// @arg next_dialog1
/// @arg next_dialog2
function scr_dialog_add_answer2(_obj, _text1, _text2, _target, _sound, _newd1, _newd2) {
	_obj.add([_text1, _text2], _target, _sound, [_newd1, _newd2]);
}

/// @arg dialog
/// @arg text1
/// @arg text2
/// @arg text3
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

/// @desc Makes dialog object that should be passed into scr_dialog
function Dialog() constructor {
	dialog = [];
	target = [];
	sound = [];
	escript = [];
	count = 0;
	endscript = noone;
	
	add = function(_text, _target, _sound, _script) {
		dialog[count] = _text;
		target[count] = _target;
		sound[count] = _sound;
		escript[count] = _script;
		count ++;
	}
	
	addEndScript = function(_script) {
		endscript = _script;
	}
}
