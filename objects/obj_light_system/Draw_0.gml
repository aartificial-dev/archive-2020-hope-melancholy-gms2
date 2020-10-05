/// @description Insert description here
// You can write your code in this editor

var camera = view_camera[0];

surface_set_target(surface_light);
with (par_light) {
	var _x = x - view_x;
	var _y = y - view_y;
	var w = width / sprite_get_width(light);
	var h = height / sprite_get_height(light);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(light, image_index, _x, _y, w, h, 0, c_white, alpha_sub);
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(light, image_index, _x, _y, w, h, 0, c_white, alpha_add);
}
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(surface_light, camera_get_view_x(camera), camera_get_view_y(camera));
draw_surface(surface_bloom, camera_get_view_x(camera), camera_get_view_y(camera));

surface_set_target(surface_bloom);
draw_clear_alpha(c_white,0);
surface_reset_target();


surface_set_target(surface_light);
draw_clear_alpha(c_black, alpha);
surface_reset_target();