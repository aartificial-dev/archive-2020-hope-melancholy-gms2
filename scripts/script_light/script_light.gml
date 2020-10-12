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

function draw_raycast() {
	var camera = view_camera[0];
	let cam_x = camera_get_view_x(camera);
	let cam_y = camera_get_view_y(camera);
	
	let _l = x - (sprite_get_width(sprite_index)  - sprite_get_xoffset(sprite_index))  * image_xscale - cam_x;
	let _r = x + (sprite_get_width(sprite_index)  - sprite_get_xoffset(sprite_index))  * image_xscale - cam_x;
	let _b = y + (sprite_get_height(sprite_index)  - sprite_get_yoffset(sprite_index))  * image_yscale - cam_y;
	let _u = y - (sprite_get_height(sprite_index)  - sprite_get_yoffset(sprite_index))  * image_yscale - cam_y;

	//draw_circle_color(_l, _b, 2, c_white, c_white, 1);
	//draw_circle_color(_r, _b, 2, c_white, c_white, 1);
	//draw_circle_color(_l, _u, 2, c_white, c_white, 1);
	//draw_circle_color(_r, _u, 2, c_white, c_white, 1);

	let _dir;
	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - 24 - cam_y, _l, _b);
	let _x1 = _l + lendir_x(1000, 0, _dir);
	let _y1 = _b + lendir_y(1000, 0, _dir);

	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - 24 - cam_y, _r, _b);
	let _x2 = _r + lendir_x(1000, 0, _dir);
	let _y2 = _b + lendir_y(1000, 0, _dir);

	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - 24 - cam_y, _l, _u);
	let _x3 = _l + lendir_x(1000, 0, _dir);
	let _y3 = _u + lendir_y(1000, 0, _dir);

	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - 24 - cam_y, _r, _u);
	let _x4 = _r + lendir_x(1000, 0, _dir);
	let _y4 = _u + lendir_y(1000, 0, _dir);

	draw_primitive_begin(pr_trianglelist);
		// bottom rectangle
		draw_vertex_color(_l, _b, c_black, 1);
		draw_vertex_color(_x1, _y1, c_black, 1);
		draw_vertex_color(_r, _b, c_black, 1);
	
		draw_vertex_color(_r, _b, c_black, 1);
		draw_vertex_color(_x2, _y2, c_black, 1);
		draw_vertex_color(_x1, _y1, c_black, 1);
	
		// left rectangle
		draw_vertex_color(_l, _u, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
		draw_vertex_color(_l, _b, c_black, 1);
	
		draw_vertex_color(_l, _b, c_black, 1);
		draw_vertex_color(_x1, _y1, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
	
		// up rectangle
		draw_vertex_color(_l, _u, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
		draw_vertex_color(_r, _u, c_black, 1);
	
		draw_vertex_color(_r, _u, c_black, 1);
		draw_vertex_color(_x4, _y4, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
	
		// right rectangle
		draw_vertex_color(_r, _u, c_black, 1);
		draw_vertex_color(_x4, _y4, c_black, 1);
		draw_vertex_color(_r, _b, c_black, 1);
	
		draw_vertex_color(_r, _b, c_black, 1);
		draw_vertex_color(_x2, _y2, c_black, 1);
		draw_vertex_color(_x4, _y4, c_black, 1);
	draw_primitive_end();
}