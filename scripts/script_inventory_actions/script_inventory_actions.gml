/// @arg item
function scr_item_use(item) {
	// return true to destroy item
	switch (item.name) {
		case "Syringe":
			audio_play_sound(snd_item_syringe, 0, 0);
			sanity += 20;
			hp += 7;
		break;
		case "Tranquilizers":
			sanity += 30;
		break;
		case "Pills":
			sanity += 10;
			hp += 3;
		break;
		case "Medkit":
			hp += 10;
		break;
		case "Tape Player":
			let sound = item.modif;
			if (audio_is_playing(sound)) {
				audio_stop_sound(sound);
			} else {
				audio_play_sound(sound, 0, 0);
			}
			return false;
		break;
		default: {
			if (obj_pl.alarm[10] == -1) {
				scr_message("I can't use this", obj_pl);
				obj_pl.alarm[10] = 15;
			}
			return false;
		}
	}
	return true;
}

/// @arg item
/// @arg hand
function scr_items_combine(item1, item2) {
	if (item1.name == "Battery" || item2.name == "Battery") {
		if (item1.name == "Broken Tape Player" || item2.name == "Broken Tape Player") {
			let sound = (item1.name == "Broken Tape Player") ? item1.modif : item2.modif;
			audio_play_sound(snd_inv_combine, 0, 0);
			let item = new Item(spr_tplayer_inv, spr_tplayer_floor, 2, 1, "Tape Player", item_type.notes, sound);
			return item;
		}
	}
	if (obj_pl.alarm[10] == -1) {
		scr_message("Can't combine these", obj_pl);
		obj_pl.alarm[10] = 15;
	}
	return noone;
}