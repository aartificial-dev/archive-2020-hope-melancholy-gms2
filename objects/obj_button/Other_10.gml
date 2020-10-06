/// @description Insert description here

let path0 = scr_dialog_init();

scr_dialog_add_line(path0, "Hello there", obj_dialog_marker_1, snd_dialog_lo, noone);

let path1 = scr_dialog_init();
let path2 = scr_dialog_init();
let path3 = scr_dialog_init();
scr_dialog_add_answer3(path0, "Feck you", "Hi", "UWU", obj_pl, snd_dialog_hi, path1, path2, path3);


scr_dialog_add_line(path1, "Ew", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(path2, "Hi", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(path3, "owo", obj_dialog_marker_1, snd_dialog_lo, noone);

let path4 = scr_dialog_init();
let path5 = scr_dialog_init();
let path6 = scr_dialog_init();
scr_dialog_add_answer3(path3, "ono", "ene", "owo", obj_pl, snd_dialog_hi, path4, path5, path6);

scr_dialog_add_line(path4, "owl", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(path5, "what", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(path6, "awoooo", obj_dialog_marker_1, snd_dialog_lo, noone);

scr_dialog(path0);