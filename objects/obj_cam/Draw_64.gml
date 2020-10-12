/// @description DEBUG

if (keyboard_check_pressed(vk_f1)) {
	show_debug = !show_debug;
	
	show_debug_overlay(show_debug);
}


if (keyboard_check_pressed(vk_f2)) {
	global.locale = 1- global.locale;
	with (par_gui_menu) {
		event_user(15);
	}
	with (par_interactive) {
		event_user(15);
	}
}
if (show_debug) {
	//
	draw_set_font_ext(fnt_pixel, fa_left, fa_top);
	if (global.locale = LOCALE_ENGLISH) {
		draw_text(10, 10, "Locale: English");
	} else {
		draw_text(10, 10, "Locale: Japanese");
	}
	
		ini_open("items_jap.ini");
		let _name = ini_read_string("DEFAULT", "battery", "BROKEN");
		ini_close();
		draw_text(10, 30, _name);
		ini_open("items_eng.ini");
		 _name = ini_read_string("DEFAULT", "battery", "BROKEN");
		ini_close();
		draw_text(10, 50, _name);
}