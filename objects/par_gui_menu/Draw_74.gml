/// @description Insert description here
// You can write your code in this editor

draw_rect_f(0, 0, gui_w, gui_h, c_black, 0, 0.5);

if (keyboard_check_pressed(vk_escape)) {
	instance_destroy();
}