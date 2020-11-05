/// @description application surface
application_surface_draw_enable(0);

if (!surface_exists(game_surface)) {
	game_surface = surface_create(view_width * window_scale, view_height * window_scale);
}
if (!surface_exists(gui_surface)) {
	gui_surface = surface_create(display_get_gui_width(), display_get_gui_height());
}


surface_set_target(application_surface); {
	shader_set(shd_blur_light);
	let uni = shader_get_uniform(shd_blur_light, "iResolution");
	let unis = shader_get_uniform(shd_blur_light, "Size");
	shader_set_uniform_f(uni, display_get_width(), display_get_height());
	shader_set_uniform_f(unis, 16.0);
	
	if (surface_exists(obj_light_system.surface_light)) {
		gpu_set_blendmode_ext(bm_dest_color, bm_zero);
		draw_surface_stretched(obj_light_system.surface_light, 0, 0, view_width * window_scale, view_height * window_scale);
		gpu_set_blendmode(bm_normal);
	}
	shader_reset();
	
	draw_surface_stretched(gui_surface, 0, 0, view_width * window_scale, view_height * window_scale);
	
	//let cur_angle = point_direction(window_mouse_get_x(), window_mouse_get_y(), view_width * window_scale / 2, view_height * window_scale / 2)
	if (blur_size != blur_size_m) {
		draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1.15, 1.15, 0, c_white, 1);
	}

	
} surface_reset_target();

surface_set_target(game_surface);
draw_clear(c_black);
shader_set_vigchrom(display_get_width(), display_get_height(), 0.5 * chrom_add, 1);
draw_surface(application_surface, 0, 0);
shader_reset();
surface_reset_target();

surface_set_target(application_surface);
draw_clear(c_black);
shader_set(shd_grain);
grain_time ++;
if (grain_time > 60) {grain_time = 1;}
let uni = shader_get_uniform(shd_grain, "iTime");
shader_set_uniform_f(uni, grain_time);
draw_surface(game_surface, 0, 0);
shader_reset();
surface_reset_target();

if (blur_size != 0) {
	shader_set(shd_blur);
	let uni = shader_get_uniform(shd_blur, "size");
	shader_set_uniform_f(uni, display_get_width(), display_get_height(), (blur_size / blur_size_m) * 20);
}

draw_surface(application_surface, 0, 0);

if (blur_size != 0) {
	shader_reset();
	window_set_cursor(cr_default);
} else {
	window_set_cursor(cr_none);
}

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();