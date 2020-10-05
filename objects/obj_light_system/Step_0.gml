/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(surface_light)) {
	surface_light = surface_create(view_w, view_h);
}
if (!surface_exists(surface_bloom)) {
	surface_bloom = surface_create(view_w, view_h);
}

let _obj = collision_point(obj_cam.x, obj_cam.y, obj_light_alpha, 0, 1);
if (_obj) {
	alpha = _obj.alpha;
} else {
	alpha = 0;
}