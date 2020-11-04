/// @arg inv
/// @arg index
/// @arg math
function inv_item_modif(_inv, _ind, _math) {
	let size = ds_list_size(_inv);
	if (_ind >= size) {
		return noone;
	}
	let cell = _inv[| _ind];
	let item = cell.item;
	let modif = item.modif;
	item.modif += _math;
	item.modif = max(0, item.modif);
	return modif;
}

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
		case "Toolkit": 
			inv_toolkit_open = !inv_toolkit_open;
			if (inv_toolkit_open) {
				audio_play_sound(snd_toolkit_open, 0, 0);
			} else {
				audio_play_sound(snd_toolkit_close, 0, 0);
			}
			return false;
		break;
		default: {
			if (obj_pl.alarm[10] == -1) {
				scr_message("cant_use");
				obj_pl.alarm[10] = 15;
			}
			return false;
		}
	}
	return true;
}

function scr_items_combine() {
	let size = ds_list_size(inv_toolkit);
	let items = [];
	for (let i = 0; i < size; i ++) {
		let cell = inv_toolkit[| i];
		items[i] = cell.item;
	}
	if (size == 2) {
		let item1 = items[0];
		let item2 = items[1];
		if (item1.name == "Battery" || item2.name == "Battery") {
			if (item1.name == "Broken Tape Player" || item2.name == "Broken Tape Player") {
				let sound = (item1.name == "Broken Tape Player") ? item1.modif : item2.modif;
				audio_play_sound(snd_inv_combine, 0, 0);
				let item = new Item(spr_tplayer_inv, spr_tplayer_floor, 2, 1, "Tape Player", "tape_player", item_type.notes, sound, TEMPLATE_ITEM_NONE);
				ds_list_clear(inv_toolkit);
				inv_item_add_at(inv_toolkit, item, 2, 1);
				return true;
			}
		}
	}
	if (obj_pl.alarm[10] == -1) {
		scr_message("cant_combine");
		obj_pl.alarm[10] = 15;
	}
	return false;
}