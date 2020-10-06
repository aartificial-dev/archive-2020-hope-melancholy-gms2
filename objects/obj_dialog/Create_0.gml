/// @description Insert description here
// You can write your code in this editor

d_current = 0; // current line of dialog
cam_target = obj_cam.target;
obj_cam.view_scale = 1.5;

current_text = ""; // current text displaying

d_appear_spd = 3; // character appear speed
d_char_num = 0; // current number of character in line
d_line_length = 0; // current line length
d_cur_length = 0; // display text length
alarm[1] = d_appear_spd;
image_speed = 0.2;

d_input_wait = 25; // how long wait before input

d_script_exec = 0;

is_branch = 0;