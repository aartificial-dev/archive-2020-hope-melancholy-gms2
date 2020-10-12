// init dialog
// scr_end_cutscene
let _dialog = scr_dialog_init("dialog", "DEMO_OFFICE");
scr_dialog_add_line(_dialog, "dialog_1_0", obj_dialog_marker_3, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "dialog_1_1", obj_dialog_marker_3, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "dialog_1_2", obj_dialog_marker_3, snd_dialog_hi, noone);
scr_dialog_add_end_script(_dialog, scr_end_cutscene);

scr_trigger_init(scr_dialog, [_dialog], 1);