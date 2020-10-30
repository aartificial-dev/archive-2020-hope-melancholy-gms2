/// @description Insert description here
// You can write your code in this editor

if (v_width != view_w || v_height != view_h) {
	surface_free(surface_light);
	surface_free(surface_shadow);
	v_width = view_w;
	v_height = view_h;
	surface_light = surface_create(view_w, view_h);
	surface_shadow = surface_create(view_w, view_h);
}

if (!surface_exists(surface_light)) {
	surface_light = surface_create(view_w, view_h);
}
if (!surface_exists(surface_shadow)) {
	surface_shadow = surface_create(view_w, view_h);
}

var camera = view_camera[0];


surface_set_target(surface_light);
draw_clear_alpha(c_black, 1);
let a_num = instance_number(obj_light_alpha);
for (let i = 0; i < a_num; i ++) {
	let ins = instance_find(obj_light_alpha, i);
	let _x = ins.x - camera_get_view_x(camera);
	let _y = ins.y - camera_get_view_y(camera);
	let _w = ins.image_xscale * 32;
	let _h = ins.image_yscale * 32;
	let _a = ins.alpha;
	draw_rect_f(_x, _y, _x + _w, _y + _h, c_white, 0, 1 - _a);
}
surface_reset_target();


surface_set_target(surface_light);
gpu_set_blendmode(bm_add);
with (par_light) {
	var _x = x - camera_get_view_x(camera);
	var _y = y - camera_get_view_y(camera);
	var w = width / sprite_get_width(light);
	var h = height / sprite_get_height(light);
	draw_sprite_ext(light, image_index, _x, _y, w, h, angle, image_blend, alpha_sub);
}
gpu_set_blendmode(bm_normal);
surface_reset_target();

surface_set_target(surface_shadow);
draw_clear_alpha(c_black, 0);
with (par_unwalk) {
	draw_raycast();
}
with (par_raycast) {
	draw_raycast();
}
surface_reset_target();