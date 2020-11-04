
/// @func inv_step
function inv_step() {
	if (inv_open) {
		inv_height = clamp(inv_height + 3, 0, inv_mheight);
	} else {
		inv_height = clamp(inv_height - 3, 0, inv_mheight);
	}
	if (inv_hand && gui_mouse_y > inv_height && mouse_check_button_pressed(mb_left)) {
		inv_drop(inv_hand);
		if (inv_hand.name == "Toolkit") {
			inv_drop_all(inv_toolkit);
				if (inv_toolkit_open) {
					audio_play_sound(snd_toolkit_close, 0, 0);
				}
			inv_toolkit_open = false;
		}
		inv_hand = noone;
	} 
	if (inv_height != inv_mheight) exit;
	
	__inv_act_step(inv_items, 117, 2, 12, 3, item_type.any, 999);
	__inv_act_step(inv_weap1, 3, 13, 5, 2, item_type.weapon, 1);
	__inv_act_step(inv_weap2, 60, 13, 5, 2, item_type.weapon, 1);
	if (inv_toolkit_open) {
		__inv_act_step(inv_toolkit, 262, 2, 5, 3, item_type.any, 999);
		let in_button = point_in_rectangle(gui_mouse_x, gui_mouse_y, 250, 2, 260, 34);
		let is_pressed = (mouse_check_button(mb_left) && inv_hand == noone);
		if (in_button && is_pressed && mouse_check_button_pressed(mb_left)) {
			let comb = scr_items_combine();
			if (comb) {
				audio_play_sound(snd_toolkit_combine, 0, 0);
			}
		}
	} else {
		__inv_chip_step();
	}
	
}

/// @func __inv_act_step
function __inv_act_step(inv, inv_x, inv_y, inv_w, inv_h, _allow_type, _amount) {
	let _allow = inv_hand ? inv_hand.type : item_type.any; // checks for item type
	if ( _allow_type != item_type.any && _allow_type != _allow && _allow != item_type.any ) return; // maybe play sound?
	if (_allow == item_type.chip) return;
	
	let scell = 11; // size of one cell w & h
	// if mouse is in inventory
	let mouse_in_inv = point_in_rectangle(gui_mouse_x, gui_mouse_y, inv_x, inv_y, inv_x + (inv_w * scell), inv_y + (inv_h * scell));
	if (mouse_in_inv) {
		let mousex, mousey;
		if (inv_hand) {
			mousex = round( (gui_mouse_x - inv_x) / scell - inv_hand.w / 2 + 0.0);
			mousey = round( (gui_mouse_y - inv_y) / scell - inv_hand.h / 2 + 0.0);
		} else {
			mousex = floor( (gui_mouse_x - inv_x) / scell + 0.0);
			mousey = floor( (gui_mouse_y - inv_y) / scell + 0.0);
		}
		// checks collision with items. 0 for cannot use. id for ds_list cell id
		let item_col = __inv_coll(inv, mousex, mousey, inv_w, inv_h);
		let _take = mouse_check_button_pressed(mb_left);
		let _use = mouse_check_button_pressed(mb_right);
		
		if (item_col >= 0 && !inv_hand && _take) {
			// pick item
			let temp = inv[| item_col];
			let new_item = temp.item;
			inv_hand = new_item;
			ds_list_delete(inv, item_col);
			audio_play_sound(snd_inv_pickup, 0, 0);
			return;
		}
		let force_swap = 0;
		if (item_col == -1 && inv_hand && _take) {
			// place item
			let _size = ds_list_size(inv);
			if (_size + 1 > _amount) { // if cannot fit more items then swap
				force_swap = 1;
			} else { // else place item normally
				let new_cell = new ICell(mousex, mousey, inv_hand);
				ds_list_add(inv, new_cell);
				inv_hand = noone;
				audio_play_sound(snd_inv_pickup, 0, 0);
				return;
			}
		}
		if ((item_col >= 0 && inv_hand && _take) || force_swap) {
			// swap items
			let temp;
			if (force_swap) {
				temp = inv[| _amount - 1];
			} else {
				temp = inv[| item_col];
			}
			let new_item = temp.item;
			let new_cell = new ICell(mousex, mousey, inv_hand);
			inv_hand = new_item;
			ds_list_add(inv, new_cell);
			if (force_swap) {
			ds_list_delete(inv, _amount - 1);
			} else {
			ds_list_delete(inv, item_col);
			}
			audio_play_sound(snd_inv_pickup, 0, 0);
			return;
		}
		if (item_col >= 0 && !inv_hand && _use) {
			// use item
			let temp = inv[| item_col];
			let item = temp.item;
			let check = scr_item_use(item);
			if (check) {
				ds_list_delete(inv, item_col);
			}
		}
		/*if (item_col >= 0 && inv_hand && _use) {
			// combine items
			let temp = inv[| item_col];
			let item = temp.item;
			let check = scr_items_combine(item, inv_hand);
			if (check != noone) {
				ds_list_delete(inv, item_col);
				inv_hand = check;
			}
		}*/
	}
}

/// @func __inv_coll
function __inv_coll(inv, mousex, mousey, inv_w, inv_h) {
	let _x = mousex + 0.1; // 0.1 for not colliding with near items
	let _y = mousey + 0.1;
	let _w = inv_hand ? (inv_hand.w - 0.1) : 0.9;
	let _h = inv_hand ? (inv_hand.h - 0.1) : 0.9;
	if (mousex < 0 || mousey < 0 || mousex + _w > inv_w || mousey + _h > inv_h) {
		return noone; // if out of inventory bounds
	}
	let _id = noone;
	let _count = 0;
	let l = ds_list_size(inv);
	for (let i = 0; i < l; i ++) {
		let cell = inv[| i];
		let ix = cell.x + 0.1; // 0.1 for not colliding with near items
		let iy = cell.y + 0.1;
		let iw = cell.w - 0.1;
		let ih = cell.h - 0.1; // there should be + 0.1 on xy and - 0.1 on hw but theres some sort of error so bweh
		
		if (rectangle_in_rectangle(ix, iy, ix + iw, iy + ih,   _x, _y, _x + _w, _y + _h)) {
			// if mouse item & inventory item collides
			_count ++;
			_id = i;
		}
	}
	
	if (_count > 0) {
		return _id; // if  one item collide
	}
	if (_count == 0) {
		return -1;
	}
	
	return noone; // if two or more collides
}

function __inv_chip_step() {
	let check = inv_hand ? inv_hand.type : item_type.chip;
	if (check != item_type.chip) return;
	
	let pass = [];
	pass[0] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 251, 2, 251 + 32, 2 + 16);		/// 251 2
	pass[1] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 285, 2, 285 + 32, 2 + 16);		/// 285 2
	pass[2] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 251, 19, 251 + 32, 19 + 16);		/// 251 19
	pass[3] = point_in_rectangle(gui_mouse_x, gui_mouse_y, 285, 19, 285 + 32, 19 + 16);		/// 285 19
	
	for (let i = 0; i < 4; i ++) {
		if (pass[i] && mouse_check_button_pressed(mb_left)) {
			if (inv_hand != noone && inv_chips[i] != noone) {
				// swap
				let temp = inv_hand;
				inv_hand = inv_chips[i];
				inv_chips[i] = temp;
				audio_play_sound(snd_inv_chip, 0, 0);
				break;
			}
			if (inv_hand == noone && inv_chips[i] != noone) {
				// pick
				inv_hand = inv_chips[i];
				inv_chips[i] = noone;
				audio_play_sound(snd_inv_chip, 0, 0);
				break;
			}
			if (inv_hand != noone && inv_chips[i] == noone) {
				// put
				inv_chips[i] = inv_hand;
				inv_hand = noone;
				audio_play_sound(snd_inv_chip, 0, 0);
				break;
			}
		}
	}
}