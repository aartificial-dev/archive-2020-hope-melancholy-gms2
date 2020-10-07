/// @description View room enable
// You can write your code in this editor

view_enabled = true;
view_visible[0] = true;
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(0, 0, view_width, view_height);
}
room_speed = 60;

let layer_back = layer_get_id(Layers.b_back);
b_back_st_x = layer_get_x(layer_back);
