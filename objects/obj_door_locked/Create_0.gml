/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Door";
icon = spr_hud_gear;
image_speed = 0;
collide = instance_create_layer(x, y, Layers.collision, obj_unwalk_door);