/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, obj_pl)) {
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
}