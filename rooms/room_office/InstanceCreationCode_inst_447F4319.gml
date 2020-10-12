let _dialog = scr_dialog_init("dialog", "DEMO_OFFICE");
scr_dialog_add_line(_dialog, "dialog_3_0", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(_dialog, "dialog_3_1", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(_dialog, "dialog_3_2", obj_dialog_marker_2, snd_dialog_hi, noone);

scr_npc_speak_init(spr_npc_office_female_idle, 0.05, npc_dir.right, "anna", _dialog);