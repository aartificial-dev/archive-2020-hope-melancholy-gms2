// init dialog
// scr_end_cutscene
let _dialog = scr_dialog_init();
scr_dialog_add_line(_dialog, "Have a nice day, ms Ayami.", obj_dialog_marker_1, snd_dialog_hi, noone);


scr_trigger_init(scr_dialog, [_dialog], 1);