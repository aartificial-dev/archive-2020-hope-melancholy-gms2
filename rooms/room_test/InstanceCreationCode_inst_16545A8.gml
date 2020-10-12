let _dialog = scr_dialog_init();
scr_dialog_add_line(_dialog, "私は言語を変えるためのシンプルなメニューを作ります", id, snd_dialog_hi, noone);
scr_trigger_init(scr_dialog, [_dialog], 1);