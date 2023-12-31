/// Math functions 


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

/// @arg dir1
/// @arg dir2
/// @arg spd
/// @arg acc
function angle_rotate(_dir1, _dir2, _spd, _acc) {
	let angleDiff = _dir1 - _dir2;
	let accuracy = abs(clamp(_acc, 0.05, 0.95) - 1.0);    // Don't want perfect accuracy or perfect inaccuracy
	
	if(abs(angleDiff) > 180) {
		if(_dir1 > _dir2) {
			angleDiff = -1 * ((360 - _dir1) + _dir2);
		}	else {
			angleDiff = (360 - _dir2) + _dir1;
		}
	}

	let leastAccurateAim = 30;
	if(angleDiff > leastAccurateAim * accuracy) {
		return _dir1 - _spd;
	} else if(angleDiff < leastAccurateAim * accuracy) {
		return _dir1 + _spd;
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


