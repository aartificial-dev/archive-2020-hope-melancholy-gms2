/// @description Insert description here
// You can write your code in this editor
let alpha = is_fade_in ? (alarm[0] / alarm_max) : 1 - (alarm[0] / alarm_max) ;

draw_rect_f(0, 0, gui_w, gui_h, c_black, 0, alpha);