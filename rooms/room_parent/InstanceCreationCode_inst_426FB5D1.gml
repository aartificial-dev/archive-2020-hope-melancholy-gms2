// init dialog
// scr_end_cutscene
let _dialog = scr_dialog_init();
scr_dialog_add_line(_dialog, "Ah, i was intent to leave early...", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "I planned a romantic dinner at a restaurant with my husband.", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "Oh hey, Ayami is here. See, she's gonna fix the door. ", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(_dialog, "Anna, you shouldn't have caused such a ruckus over a minor problem. ", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(_dialog, "Piss off man!", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "I rarely can get a chance to spend time with my family.", obj_dialog_marker_2, snd_dialog_hi, noone);


scr_trigger_init(scr_dialog, [_dialog], 1);