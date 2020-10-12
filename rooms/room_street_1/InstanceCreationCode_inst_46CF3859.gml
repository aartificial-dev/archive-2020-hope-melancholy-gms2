// init dialog
// scr_end_cutscene
let _dialog = scr_dialog_init("dialog", "DEMO_STREET");
scr_dialog_add_line(_dialog, "dialog_1_0", obj_dialog_marker_1, snd_dialog_hi, noone);


scr_trigger_init(scr_dialog, [_dialog], 1);