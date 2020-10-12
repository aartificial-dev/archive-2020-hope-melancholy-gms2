

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
	ini_name = _name;
	dialog = _dialog;
}

enum npc_dir {
	left = -1,
	right = 1
}