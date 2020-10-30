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
	let locale = global.locale == LOCALE_ENGLISH ? "English" : "Japanese";
	console_log("Game locale set to '"  + string(locale) + "'");
}

if (keyboard_check_pressed(vk_f3)) {
	game_restart();
}

if (show_debug) {
	draw_set_font_ext(fnt_pixel, fa_left, fa_top);
	draw_text(10, 10, "fps: " + string(fps) + ", fps_real: " + string(fps_real));
	if (global.locale = LOCALE_ENGLISH) {
		draw_text(10, 25, "Locale: English");
	} else {
		draw_text(10, 25, "Locale: Japanese");
	}
}