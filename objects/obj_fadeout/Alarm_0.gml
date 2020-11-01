/// @description Insert description here
// You can write your code in this editor

if (is_method(al_script)) {
	al_script();
} else {
	if (script_exists(al_script)) {
		script_execute(al_script);
	}
}

instance_destroy();