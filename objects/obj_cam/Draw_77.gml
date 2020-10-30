/// @description light & effects
application_surface_draw_enable(0);

if (!surface_exists(game_surface)) {
	game_surface = surface_create(view_width * window_scale, view_height * window_scale);
}

surface_set_target(game_surface); {
	
	// draw application surface
	shader_set_vigchrom(display_get_width(), display_get_height(), 0.5, 1);
	draw_surface(application_surface, 0, 0);
	shader_reset();
	
	// draw light surface with blur
	if (surface_exists(obj_light_system.surface_light)) {
		shader_set(shd_blur_light);
		let uni = shader_get_uniform(shd_blur_light, "iResolution");
		let unis = shader_get_uniform(shd_blur_light, "Size");
		shader_set_uniform_f(uni, display_get_width(), display_get_height());
		shader_set_uniform_f(unis, 64.0);

		gpu_set_blendmode_ext(bm_dest_color, bm_zero);
		draw_surface_stretched(obj_light_system.surface_light, 0, 0, view_width * window_scale, view_height * window_scale);

		gpu_set_blendmode(bm_normal);

		shader_reset();
	}
	// draw shadow surface with blur
	if (surface_exists(obj_light_system.surface_shadow)) {
		shader_set(shd_blur_light);

		let uni = shader_get_uniform(shd_blur_light, "iResolution");
		let unis = shader_get_uniform(shd_blur_light, "Size");
		shader_set_uniform_f(uni, display_get_width(), display_get_height());
		shader_set_uniform_f(unis, 16.0);
		draw_surface_stretched(obj_light_system.surface_shadow, 0, 0, view_width * window_scale, view_height * window_scale);

		shader_reset();
	}

} surface_reset_target();


if (blur_size != 0) {
	shader_set(shd_blur);
	let uni = shader_get_uniform(shd_blur, "size");
	shader_set_uniform_f(uni, display_get_width(), display_get_height(), (blur_size / blur_size_m) * 20);
}

draw_surface(game_surface, 0, 0);

if (blur_size != 0) {
	shader_reset();
}
