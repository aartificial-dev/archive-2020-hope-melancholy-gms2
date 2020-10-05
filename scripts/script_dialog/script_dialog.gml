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

/// @arg text
/// @arg target
/// @arg sound
/// @arg script
function scr_dialog_oneline(_dia, _tar, _snd, _scr) {
	let _dialog = new Dialog([_dia], [_tar], [_snd], [_scr]);
	scr_dialog(_dialog);
}

function scr_dialog_camshake() {
	scr_camera_shake(cam_shake.both, 10, 120);
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
