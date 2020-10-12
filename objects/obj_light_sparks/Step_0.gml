/// @description Insert description here
// You can write your code in this editor

let _channel = animcurve_get_channel(acur_flash, 0);
let _amount = animcurve_channel_evaluate(_channel, alarm[0] / 14);
alpha_sub = 0.4 * _amount;