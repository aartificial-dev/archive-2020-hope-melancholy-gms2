// init dialog
// scr_end_cutscene
let _dialog = scr_dialog_init("dialog", "DEMO_OFFICE");
scr_dialog_add_line(_dialog, "dialog_2_0", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "dialog_2_1", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "dialog_2_2", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(_dialog, "dialog_2_3", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(_dialog, "dialog_2_4", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "dialog_2_5", obj_dialog_marker_2, snd_dialog_hi, noone);


scr_trigger_init(scr_dialog, [_dialog], 1);