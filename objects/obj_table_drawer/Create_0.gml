/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ini_name = "table";
icon = spr_hud_hand;

item = noone;

image_index = 0;
image_speed = 0;

let tab = instance_create_layer(x, y, Layers.furniture, obj_table);
tab.image_alpha = 0;