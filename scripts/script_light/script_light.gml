/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
function draw_sprite_bloom(argument0, argument1, argument2, argument3) {
	draw_sprite_bloom_ext(argument0, argument1, argument2, argument3, 1, 1, 0, c_white, 1);
}

/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
/// @arg xscale
/// @arg yscale
/// @arg rot
/// @arg color
/// @arg alpha
function draw_sprite_bloom_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	//if (!instance_exists(obj_light_system)) {return;}
	//if (!surface_exists(obj_light_system.surface_bloom)) {return;}
	//surface_set_target(obj_light_system.surface_bloom);
		gpu_set_blendmode(bm_add);
			draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
		gpu_set_blendmode(bm_normal);
	//surface_reset_target();
}

function draw_sprite_bloom_self() {
	draw_sprite_bloom_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
