/// @description View room enable & Layers
// You can write your code in this editor

view_enabled = true;
view_visible[0] = true;
if (view_camera[0] == -1) {
	view_camera[0] = camera_create_view(0, 0, view_width, view_height);
}
room_speed = 60;

let layer_back = layer_get_id(Layers.b_back);
b_back_st_x = layer_get_x(layer_back);

let layer_asset = layer_get_id(Layers.s_effect);
layer_script_begin(layer_asset, seq_effect_begin);
layer_script_end(layer_asset, seq_effect_end);