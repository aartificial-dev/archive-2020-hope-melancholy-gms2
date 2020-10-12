/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

let _dia = scr_dialog_init("dialog", "GENERAL");
scr_dialog_add_line(_dia, "mirror", obj_pl, snd_dialog_hi, noone);
scr_dialog(_dia);
