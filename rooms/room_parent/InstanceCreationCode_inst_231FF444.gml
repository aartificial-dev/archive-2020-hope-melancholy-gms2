// init dialog
// scr_end_cutscene
let _dialog = scr_dialog_init();
scr_dialog_add_line(_dialog, "Ayami, there's a problem with the elevator door...", obj_dialog_marker_3, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "It seems the electrical lock is busted.", obj_dialog_marker_3, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "But I suggest you check it out yourself, you're more qualified.", obj_dialog_marker_3, snd_dialog_hi, noone);
scr_dialog_add_end_script(_dialog, scr_end_cutscene);

scr_trigger_init(scr_dialog, [_dialog], 1);