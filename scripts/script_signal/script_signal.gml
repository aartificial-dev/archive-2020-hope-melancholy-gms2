function signals_handler() {
	global.signals = ds_list_init();
}

function signals_clear() {
	ds_list_clear(global.signals);
}

/// @arg signal
function signal_get(_s) {
	if ( ds_list_find_index(global.signals, _s) != -1 ) {
		return true;
	}
	return false;
}

/// @arg signal
function signal_send(_s) {
	ds_list_add(global.signals, _s);
}

/// @arg x
/// @arg y
/// @arg distance		Distance in pixels for "hearing" sound
/// @arg host				Host of sound
/// @arg loudness		Loudness of sound. Must be in 0 - 1 range
/// @arg time				Time for sound to became mute
function signal_sound_emit(_x, _y, _dist, _host, _loud, _time) {
	let sound_emit = instance_create_layer(_x, _y, Layers.system, obj_sound_emit);
	sound_emit.distance = max(1, _dist);
	sound_emit.loudness = clamp(_loud, 0, 1);
	sound_emit.host = _host;
	sound_emit.alarm_max = max(1, _time);
	sound_emit.alarm[0] = max(1, _time);
}

/// @arg x
/// @arg y
/// @arg threshold
/// @arg host
function signal_sound_hear(_x, _y, _tres, _host) {
	if (instance_exists(obj_sound_emit)) {
		let num = instance_number(obj_sound_emit);
		for (let i = 0; i < num; i++) {
			let sound_emit = instance_find(obj_sound_emit, i);
			let collider = collision_line(_x, _y, sound_emit.x, sound_emit.y, par_unwalk, 0, 1);
			let is_host = (_host != noone) ? (sound_emit.host == _host) : true;
			
			let distance = point_distance(_x, _y, sound_emit.x, sound_emit.y);
			let sound_fade = (sound_emit.alarm[0] / sound_emit.alarm_max); // natural sound fading
			let sound_dist = (1 - clamp(distance / sound_emit.distance, 0, 1)); // makes distance float in 0 - 1 range
			let is_heard = _tres <= (sound_emit.loudness * sound_fade * sound_dist); // checks threshold pass
			
			if (collider == noone && is_host && is_heard) {
				return true;
			}
		}
	} else {
		return false;
	}
}

