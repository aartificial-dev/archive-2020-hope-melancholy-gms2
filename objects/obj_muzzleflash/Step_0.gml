/// @description Insert description here
// You can write your code in this editor

let _channel = animcurve_get_channel(acur_flash, 0);
let _amount = animcurve_channel_evaluate(_channel, image_index / image_number);
alpha_sub = _amount / 2;
alpha_add = _amount / 8;
angle = dir;