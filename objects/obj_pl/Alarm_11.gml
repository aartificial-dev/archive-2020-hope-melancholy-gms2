/// @description Room goto
// You can write your code in this editor
let marker = scr_get_marker_id(global.r_trans_obj);
if (marker) {
	x = marker.x;
	y = marker.y;
	cam.x = marker.x;
	cam.y = marker.y;
	global.r_trans_obj = noone;
}