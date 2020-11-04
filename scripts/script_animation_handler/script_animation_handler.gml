
#macro ANIM_IDLE            0
#macro ANIM_WALK            1
#macro ANIM_HURT            2
#macro ANIM_DIE             3
#macro ANIM_FALL            4
#macro ANIM_ATTACK_MELEE    5
#macro ANIM_ATTACK_RANGE    6
#macro ANIM_WALL            7
#macro ANIM_RELOAD					8
#macro ANIM_STANCE					9

#macro ANIM_SMOKE           20
#macro ANIM_ATTACK_TUBE     21
#macro ANIM_ATTACK_PUNCH    22
#macro ANIM_ATTACK_FIREARM  23
#macro ANIM_FLASHLIGHT			24

function animation_init() {
	_animation_handler = new AnimationHandler();
}

/// @arg state
/// @arg sprite
/// @arg speed
function animation_bind(_state, _sprite, _speed) {
	_animation_handler.spr[? _state] = _sprite;
	_animation_handler.spd[? _state] = _speed;
}

/// @arg state
function animation_play(_state) {
	if (!animation_is_bind(_state)) {
		console_log("Cannot play '" + string(_state) + "' animation.");
		return;
	}
	if (_animation_handler.state != _state) {
		_animation_handler.state = _state;
		_animation_handler.frame = 0;
	}
}

///
function animation_step() {
	let _sprite = animation_get_current_sprite();
	let _speed = animation_get_current_speed();
	let _frame = animation_get_frame();
	let _maxframe = sprite_get_number(_sprite);
	let _newframe = _frame + _speed;
	if (_newframe >= _maxframe) {_newframe -= _maxframe;}
	_animation_handler.frame = _newframe;
}

///
function animation_draw() {
	if (_animation_handler.state != noone) {
		let _sprite = animation_get_current_sprite();
		let _frame = animation_get_frame();
		let _xscale = _animation_handler.xscale;
		let _yscale = _animation_handler.yscale;
		let _dir = _animation_handler.dir;
		let _alpha = _animation_handler.alpha;
		draw_sprite_ext(_sprite, _frame, x, y, _xscale, _yscale, _dir, c_white, _alpha);
	}
}

/// @arg frame
function animation_set_frame(_fr) {
	_animation_handler.frame = _fr;
}

/// @arg xscale
function animation_set_xscale(_xsc) {
	_animation_handler.xscale = _xsc;
}

/// @arg yscale
function animation_set_yscale(_ysc) {
	_animation_handler.yscale = _ysc;
}

/// @arg direction
function animation_set_direction(_dir) {
	_animation_handler.dir = _dir;
}
/// @arg alpha
function animation_set_alpha(_alpha) {
		_animation_handler.alpha = _alpha;
}

///
function animation_get_frame() {
	return _animation_handler.frame;
}

/// @arg state
function animation_get_sprite(_state) {
	if (!animation_is_bind(_state)) {
		console_log("Cannot get sprite of '" + string(_state) + "' animation.");
		return 0;
	}
	return _animation_handler.spr[? _state];
}

/// @arg state
function animation_get_speed(_state) {
	if (!animation_is_bind(_state)) {
		console_log("Cannot get speed of '" + string(_state) + "' animation.");
		return 0;
	}
	return _animation_handler.spd[? _state];
}

/// @arg state
function animation_get_length(_state) {
	if (!animation_is_bind(_state)) {
		console_log("Cannot get length of '" + string(_state) + "' animation.");
		return 0;
	}
	let _sprite = animation_get_sprite(_state);
	let _maxframe = sprite_get_number(_sprite);
	let _spd = animation_get_speed(_state);
	return _maxframe / _spd;
}

///
function animation_get_current_speed() {
	let _state = animation_get_current_state();
	return animation_get_speed(_state);
}

///
function animation_get_current_sprite() {
	let _state = animation_get_current_state();
	return animation_get_sprite(_state);
}

///
function animation_get_current_state() {
	return _animation_handler.state;
}

function animation_get_current_number() {
	let _state = animation_get_current_state();
	let _sprite = animation_get_sprite(_state);
	let _maxframe = sprite_get_number(_sprite);
	return _maxframe;
}

/// @arg state
function animation_is_bind(_state) {
	return ds_map_exists(_animation_handler.spr, _state);
}

///
function AnimationHandler() constructor {
	state = noone;
	spr = ds_map_create();
	spd = ds_map_create();
	frame = 0;
	xscale = 1;
	yscale = 1;
	dir = 0;
	alpha = 1;
	
	destroy = function () {
		ds_map_destroy(spr);
		ds_map_destroy(spd);
	}
}