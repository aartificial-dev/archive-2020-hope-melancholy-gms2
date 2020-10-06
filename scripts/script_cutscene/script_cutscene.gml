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