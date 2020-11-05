/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_cam) && instance_number(obj_cam) > 1) {instance_destroy();}
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

menu_opened = 0;
blur_size = 0;
blur_size_m = 37;

game_surface = noone;
gui_surface = noone;
game_surface_grain = noone;

target = obj_pl;

if (!gpu_get_alphatestenable()) {
	//gpu_set_alphatestenable(true);
	//gpu_set_alphatestref(128);
}

grain_time = 0;

ds_amount = 0;

chrom_add = 1;

window_set_cursor(cr_none);
//cursor_sprite = spr_cursor;