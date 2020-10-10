/// @description Insert description here
// You can write your code in this editor

a_ratio = 16/9;

view_width = 320;
view_height = view_width / a_ratio;

window_scale = 4;
view_scale = 1;
actual_scale = 1;

window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;
surface_resize(application_surface, view_width * window_scale, view_height * window_scale);

//draw_set_font(font_pixel);

display_set_gui_size(view_width, view_height);

shake_amount = 0;
shake_type = 0;

show_debug = 0;


b_back_st_x = 0;

if (!gpu_get_alphatestenable()) {
	//gpu_set_alphatestenable(true);
	//gpu_set_alphatestref(128);
}