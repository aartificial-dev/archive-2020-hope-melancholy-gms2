/// @description Insert description here
if (iteration == 0) {
	let _text = ["Testing the text", "I'm Button", "And I'm Player. Yoroshiku Onegaishimasu", "And this is surely too big text for exact one line but im putting it", "Oh, and try to make inventory with this bud"];
	let _obj = [obj_pl, id, obj_pl, id, obj_item_gun];
	let _snd = [snd_dialog_hi, snd_dialog_lo, snd_dialog_hi, snd_dialog_lo, snd_dialog_lo];
	let _scr = [noone, noone, noone, noone, noone];
	let _dia = new Dialog(_text, _obj, _snd, _scr);
	scr_dialog(_dia);
}
if (iteration == 1) {
	let _text = ["Ok, look. I will show you four markers. Don't loose them", "That's first", "That's second", "That's third", "And it's fourth one", "Got it?"];
	let _obj = [id, obj_dialog_marker_1, obj_dialog_marker_2, obj_dialog_marker_3, obj_dialog_marker_4, id];
	let _snd = [snd_dialog_lo, snd_dialog_lo, snd_dialog_lo, snd_dialog_lo, snd_dialog_lo, snd_dialog_lo];
	let _scr = [noone, noone, noone, noone, noone, noone];
	let _dia = new Dialog(_text, _obj, _snd, _scr);
	scr_dialog(_dia);
}
if (iteration > 1) {
	scr_dialog_f("Find something else to disturb", id, snd_dialog_lo, scr_dialog_camshake);
}
iteration ++;