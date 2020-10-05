/// @desc Should delete it
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

/// @desc Creates dialog object and passes Dialog struct into it
/// @arg dialog_obj
function scr_dialog(_obj) {
	if (instanceof(_obj) != "Dialog") {
		show_debug_message("Cannot set dialog.")
		exit;
	}
	let dbox = instance_create_layer(0, 0, Layers.gui, obj_dialog);
	dbox.scene = _obj;
}

/// @desc Makes dialog object that should be passed into scr_dialog
/// @arg dialog[i]
/// @arg object[i]
/// @arg sound[i]
/// @arg script[i]
function Dialog(_dia, _tar, _snd, _scr) constructor {
	dialog = [];
	target = [];
	sound = [];
	escript = [];
	
	size = min(array_length(_dia), array_length(_tar), array_length(_snd), array_length(_scr));
	for (let i = 0; i < size; i ++) {
		dialog[ i] = _dia[i];
		target[ i] = _tar[i];
		sound[ i] = _snd[i];
		escript[ i] = _scr[i];
	}
	
}

/// @arg text
/// @arg target
/// @arg sound
/// @arg script
function scr_dialog_f(_dia, _tar, _snd, _scr) {
	let _dialog = new Dialog([_dia], [_tar], [_snd], [_scr]);
	scr_dialog(_dialog);
}

function scr_dialog_camshake() {
	scr_camera_shake(cam_shake.both, 10, 120);
}