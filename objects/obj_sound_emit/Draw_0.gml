/// @description Insert description here
// You can write your code in this editor

//draw_self();
if (obj_cam.show_debug) {
	let csize = distance;
	let asize = 1 - (alarm[0] / alarm_max);

	draw_set_alpha(loudness * asize);
	draw_circle_color(x, y, asize * csize, c_white, c_white, 0);
	draw_set_alpha(1);
	draw_circle_color(x, y, asize * csize, c_white, c_white, 1);
}