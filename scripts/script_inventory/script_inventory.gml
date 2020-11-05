enum item_type {
	any,
	weapon,
	quest,
	garbage,
	chip,
	ammo,
	medicine,
	keycard,
	notes,
	tool
}

/// @func inv_create
function inv_create() {
	inv_items = ds_list_init(); // accepts Item
	inv_weap1 = ds_list_init();
	inv_weap2 = ds_list_init();
	inv_toolkit = ds_list_init();
	
	inv_chips = [noone, noone, noone, noone];
	
	inv_height = 0; //37;
	inv_mheight = 37;
	inv_open = 0;
	inv_toolkit_open = 0;
	
	inv_hand = noone;
}

function inv_destroy() {
	ds_list_destroy(inv_items);
	ds_list_destroy(inv_weap1);
	ds_list_destroy(inv_weap2);
	ds_list_destroy(inv_toolkit);
}

/// @func inv_pickup
/// @arg item
function inv_pickup(_item) {
	with (obj_pl) {
		if (inv_hand) {
			return;
		}
		inv_hand = _item;
		audio_play_sound(snd_inv_pickup, 0, 0);
	}
}

/// @func inv_drop
/// @arg item
function inv_drop(_item) {
	let _x = clamp(mouse_x, x - (hand_length - 10), x + (hand_length - 10));
	let _y = clamp(mouse_y, y - 40, y);
	let _obj = instance_create_layer(_x, _y, Layers.items, par_item);
	_obj.item = _item;
	audio_play_sound(snd_inv_drop, 0, 0);
}

/// @arg item
/// @arg x
/// @arg y
function scr_item_summon(_item, _x, _y) {
	let _obj = instance_create_layer(_x, _y, Layers.items, par_item);
	_obj.item = _item;
	audio_play_sound(snd_inv_drop, 0, 0);
}

/// @arg inv
function inv_drop_all(_inv) {
	// drop all items from inventory
	let size = ds_list_size(_inv);
	for (let i = 0; i < size; i ++) {
		let cell = _inv[| i];
		let item = cell.item;
		let _x = - (hand_length / 2) + (i * (hand_length / size));
		scr_item_summon(item, x + _x, y - 20);
	}
	ds_list_clear(_inv);
}

/// @arg inv
/// @arg item
/// @arg x
/// @arg y
function inv_item_add_at(_inv, _item, _x, _y) {
	// add item to certain point of inventory
	let cell = new ICell(_x, _y, _item);
	ds_list_add(_inv, cell);
}

/// @arg inv
/// @arg inv_name
function inv_save(_inv, _name) {
	let _str = "";
	let size = ds_list_size(_inv);
	_str += "[" + string(_name) + "]\n";
	_str += "item_count = " + string(size) + "\n\n";
	for (let i = 0; i < size; i ++) {
		let cell = _inv[| i];
		_str += "[" + string(_name) + "~" + string(i) + "]\n";
		_str += "x = " + string(cell.x) + "\n";
		_str += "y = " + string(cell.y) + "\n";
		_str += string(cell.item.save());
		_str += "\n\n";
	}
	return _str;
}



