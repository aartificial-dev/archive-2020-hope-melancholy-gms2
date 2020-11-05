/// @desc Makes dialog object that should be passed into scr_dialog
/// @arg file_prefix
/// @arg section
class Dialog(_pref, _section) constructor {
	dialog = [];
	pref = _pref;
	section = _section;
	target = [];
	sound = [];
	escript = [];
	count = 0;
	endscript = noone;
	
	add = function(_key, _target, _sound, _script) {
		dialog[count] = _key;
		target[count] = _target;
		sound[count] = _sound;
		escript[count] = _script;
		count ++;
	}
}