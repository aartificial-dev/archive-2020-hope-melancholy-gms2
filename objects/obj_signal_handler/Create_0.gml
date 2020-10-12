/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_signal_handler) && instance_number(obj_signal_handler) > 1) {instance_destroy();}
signals_handler();