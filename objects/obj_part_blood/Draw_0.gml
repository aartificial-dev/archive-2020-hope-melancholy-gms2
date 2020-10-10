/// @description Insert description here
// You can write your code in this editor

let _channel = animcurve_get_channel(acur_flash, 0);
let _amount = animcurve_channel_evaluate(_channel, alarm[0] / timer);
let _size = (1 - alarm[0] / timer);
draw_sprite_ext(spr_blood, all, x, y, image_xscale * _amount, image_yscale * _amount, image_angle, c_white, _amount);