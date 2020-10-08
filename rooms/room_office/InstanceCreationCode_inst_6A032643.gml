let dialog = scr_dialog_init();
scr_dialog_add_line(dialog, "If you want something, then ask Anna.", obj_dialog_marker_1, snd_dialog_lo, noone);

scr_npc_speak_init(spr_npc_office_male_idle, 0.05, npc_dir.left, "Jake", dialog);