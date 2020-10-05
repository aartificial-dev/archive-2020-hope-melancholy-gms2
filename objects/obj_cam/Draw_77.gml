/// @description Insert description here
application_surface_draw_enable(0);
shader_set_vigchrom(display_get_width(), display_get_height(), 0.5, 0.5);
draw_surface(application_surface, 0, 0);
shader_reset();