/// Math functions 

/// @func vec2
/// @arg x
/// @arg y
function vec2(_x, _y) constructor {
	x = _x;
	y = _y;
	static add = function( _vec2 ) {
		x += _vec2.x;
		y += _vec2.y;
	}
	static subt = function( _vec2 ) {
		x -= _vec2.x;
		y -= _vec2.y;
	}
	static divide = function( _vec2 ) {
		x /= _vec2.x;
		y /= _vec2.y;
	}
	static mult = function( _vec2 ) {
		x *= _vec2.x;
		y *= _vec2.y;
	}
}

/// @func vec3
/// @arg x
/// @arg y
/// @arg z
function vec3(_x, _y, _z) constructor {
	x = _x;
	y = _y;
	z = _z;
	static add = function( _vec3 ) {
		x += _vec3.x;
		y += _vec3.y;
		z += _vec3.z;
	}
	static subt = function( _vec3 ) {
		x -= _vec3.x;
		y -= _vec3.y;
		z -= _vec3.z;
	}
	static divide = function( _vec3 ) {
		x /= _vec3.x;
		y /= _vec3.y;
		z /= _vec3.z;
	}
	static mult = function( _vec3 ) {
		x *= _vec3.x;
		y *= _vec3.y;
		z *= _vec3.z;
	}
}

/// @func dir_diff
/// @arg dir1
/// @arg dir2
function dir_diff(argument0, argument1) {
	let diff;
	diff = (argument1 - argument0) mod 360;
	if (diff < 0){
	  diff += 360;
	}
	if (diff > 180){
	  return -(360 - diff);
	}else{
	  return diff;
	}
}

/// @func dir_in
/// @arg dir
/// @arg dir_for
/// @arg diff
function dir_in(argument0, argument1, argument2) {
	let dir = argument0;
	let dir_for = argument1;
	let diff = argument2;

	let dir_for1 = dir_for - diff;
	let dir_for2 = dir_for + diff;

	if (dir_for + diff > 360 && dir < 180) {
		dir += 360;
	}else	if (dir_for - diff < 0 && dir > 180) {
		dir -= 360;
	}
	return real_in(dir, dir_for1, dir_for2);
}

/// @func lendir_x
/// @arg x
/// @arg y
/// @arg dir
function lendir_x(argument0, argument1, argument2) {
	return (lengthdir_x(argument0,argument2)-lengthdir_y(argument1,argument2));
}


/// @func lendir_y
/// @arg x
/// @arg y
/// @arg dir
function lendir_y(argument0, argument1, argument2) {
	return (lengthdir_y(argument0,argument2)+lengthdir_x(argument1,argument2));
}


/// @func real_in
/// @arg real
/// @arg min
/// @arg max
function real_in(argument0, argument1, argument2) {
	return (argument0 >= argument1 && argument0 <= argument2);
}
