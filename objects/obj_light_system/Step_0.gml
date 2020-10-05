/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(surface_light)) {
	surface_light = surface_create(view_w, view_h);
}
if (!surface_exists(surface_bloom)) {
	surface_bloom = surface_create(view_w, view_h);
}
