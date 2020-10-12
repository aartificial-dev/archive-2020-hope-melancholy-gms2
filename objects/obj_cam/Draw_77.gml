/// @description Insert description here
application_surface_draw_enable(0);

surface_set_target(application_surface);
if (surface_exists(obj_light_system.surface_light)) {
	shader_set(shd_blur);
	let uni = shader_get_uniform(shd_blur, "iResolution");
	let unis = shader_get_uniform(shd_blur, "Size");
	shader_set_uniform_f(uni, display_get_width(), display_get_height());
	shader_set_uniform_f(unis, 64.0);

	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	draw_surface_stretched(obj_light_system.surface_light, 0, 0, view_width * window_scale, view_height * window_scale);

	gpu_set_blendmode(bm_normal);

	shader_reset();
}
if (surface_exists(obj_light_system.surface_shadow)) {
	shader_set(shd_blur);

	let uni = shader_get_uniform(shd_blur, "iResolution");
	let unis = shader_get_uniform(shd_blur, "Size");
	shader_set_uniform_f(uni, display_get_width(), display_get_height());
	shader_set_uniform_f(unis, 16.0);
	draw_surface_stretched(obj_light_system.surface_shadow, 0, 0, view_width * window_scale, view_height * window_scale);

	shader_reset();
}
surface_reset_target();

shader_set_vigchrom(display_get_width(), display_get_height(), 0.5, 1);

draw_surface(application_surface, 0, 0);

shader_reset();