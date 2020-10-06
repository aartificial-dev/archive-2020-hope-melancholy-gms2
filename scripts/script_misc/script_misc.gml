/// @arg sprite
/// @arg image_speed
/// @arg direction
function scr_npc_init(_spr, _spd, _dir) {
	sprite_index = _spr;
	image_speed = random_range(_spd - (_spd / 2), _spd + (_spd / 2));
	image_xscale = _dir; 
}

/// @arg sprite
/// @arg image_speed
/// @arg direction
/// @arg name
/// @arg dialiog
function scr_npc_speak_init(_spr, _spd, _dir, _name, _dialog) {
	sprite_index = _spr;
	image_speed = random_range(_spd - (_spd / 2), _spd + (_spd / 2));
	image_xscale = _dir; 
	name = _name;
	dialog = _dialog;
}

enum npc_dir {
	left = -1,
	right = 1
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
