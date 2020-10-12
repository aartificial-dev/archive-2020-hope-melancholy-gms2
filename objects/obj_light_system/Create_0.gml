/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_light_system) && instance_number(obj_light_system) > 1) {instance_destroy();}
surface_light = surface_create(view_w, view_h);
surface_shadow = surface_create(view_w, view_h);
alpha = 0;
x = 0;
y = 0;

v_width = view_w;
v_height = view_h;