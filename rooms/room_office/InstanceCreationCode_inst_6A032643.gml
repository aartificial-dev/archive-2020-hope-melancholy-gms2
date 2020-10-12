let _dialog = scr_dialog_init("dialog", "DEMO_OFFICE");
scr_dialog_add_line(_dialog, "dialog_4_0", obj_dialog_marker_1, snd_dialog_lo, noone);

scr_npc_speak_init(spr_npc_office_male_idle, 0.05, npc_dir.left, "jake", _dialog);