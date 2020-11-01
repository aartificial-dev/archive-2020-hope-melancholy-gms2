enum item_type {
	any,
	weapon,
	quest,
	garbage,
	chip,
	ammo,
	medicine,
	keycard,
	notes
}

/// @func inv_create
function inv_create() {
	inv_items = ds_list_init(); // accepts Item
	inv_weap1 = ds_list_init();
	inv_weap2 = ds_list_init();
	
	inv_chips = [noone, noone, noone, noone];
	
	inv_height = 0; //37;
	inv_mheight = 37;
	inv_open = 0;
	
	inv_hand = noone;
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

/// @func Item
/// @arg sprite
/// @arg sprite_floor
/// @arg width
/// @arg height
/// @arg name
/// @arg ini_name
/// @arg type
/// @arg modif
function Item(_sprite, _fsprite, _w, _h, _name, _ini, _type, _modif) constructor {
	sprite = _sprite;
	sprite_floor = _fsprite;
	w = _w;
	h = _h;
	name = _name;
	ini = _ini;
	type = _type;
	modif = _modif;
	
	save = function() {
		return ;
	}
}

/// @func ICell
/// @arg x
/// @arg y
/// @arg item
function ICell(_x, _y, _item) constructor {
	x = _x;
	y = _y;
	w = _item.w;
	h = _item.h;
	item = _item;
	sprite = _item.sprite;
}

