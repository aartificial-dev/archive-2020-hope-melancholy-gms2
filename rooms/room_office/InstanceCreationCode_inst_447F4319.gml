let dialog = scr_dialog_init();
scr_dialog_add_line(dialog, "Have you heard that manager moved to 328 office?", obj_dialog_marker_2, snd_dialog_hi, noone);
scr_dialog_add_line(dialog, "Sure she knew, it's a big news all over the place!", obj_dialog_marker_1, snd_dialog_lo, noone);
scr_dialog_add_line(dialog, "Oh, I'm so silly. By the way, have you fixed lift already?", obj_dialog_marker_2, snd_dialog_hi, noone);

scr_npc_speak_init(spr_npc_office_female_idle, 0.05, npc_dir.right, "Anna", dialog);