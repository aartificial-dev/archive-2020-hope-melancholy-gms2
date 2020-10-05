/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, obj_pl) && is_active == 0) {
	is_active = 1;
	if (script_exists(trigger)) {
		if (arg == noone) {
			script_execute(trigger);
		} else {
			script_execute(trigger, arg);
		}
	}
	if (destroy) {
		instance_destroy();
	}
} else if (!place_meeting(x, y, obj_pl)) {
	is_active = 0;
}