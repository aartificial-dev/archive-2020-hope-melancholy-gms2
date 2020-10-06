let _dialog = scr_dialog_init();

scr_dialog_add_line(_dialog, "Have you heard that manager moved to 328 office?", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "Sure she knew, it's a big news all over the place!", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(_dialog, "Oh, I'm so silly! By the way, have you fixed lift already?", obj_dialog_marker_2, snd_dialog_hi, noone);

let _dia2 = scr_dialog_init();
let _dia3 = scr_dialog_init();

scr_dialog_add_answer2(_dialog, "I'm on my way.", "Why YOU haven't made it already?", obj_pl, snd_dialog_hi, _dia2, _dia3);



scr_dialog_add_line(_dia2, "Thanks cutie *winks*", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dia3, "How rude!", obj_dialog_marker_2, snd_dialog_lo, noone);

scr_npc_speak_init(spr_npc_office_female_idle, 0.05, npc_dir.right, "Anna", _dialog);