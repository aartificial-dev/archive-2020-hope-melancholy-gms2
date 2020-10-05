/// @description DEBUG

if (keyboard_check_pressed(vk_f1)) {
	show_debug = !show_debug;
	
	show_debug_overlay(show_debug);
}

if (show_debug) {
	//
}