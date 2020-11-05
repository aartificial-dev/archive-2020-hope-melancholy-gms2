function script_game_save() {
	let save = "";
	save += "[game]\n";
	save += "version = \"" + string(GM_version) + "\"\n\n";
	
	save += "[player]\n";
	save += "room = " + string(room) + "\n";
	save += "x = " + string(obj_pl.x) + "\n";
	save += "y = " + string(obj_pl.y) + "\n";
	save += "hp = " + string(obj_pl.hp) + "\n";
	save += "sanity = " + string(obj_pl.sanity) + "\n";
	// add weapons ammo
	
	
	save += "\n";
	save += string(inv_save(obj_pl.inv_items, "inv_items"));
	save += string(inv_save(obj_pl.inv_weap1, "inv_weap1"));
	save += string(inv_save(obj_pl.inv_weap2, "inv_weap2"));
	save += string(inv_save(obj_pl.inv_toolkit, "inv_toolkit"));
	// add UID for some items
	// save chips
	for (let i = 0; i < 4; i ++) {
		save += "[inv_chips~" + string(i) + "]\n";
		let _chip = obj_pl.inv_chips[i];
		if (_chip != noone) {
			save += "exists = 1\n";
			save += _chip.save();
			save += "\n"
		} else {
			save += "exists = 0\n";
		}
	}
	
	save = base64_encode(save);
	let file = file_text_open_write("save.dat");
	file_text_write_string(file, save);
	
	file_text_close(file);
	
	console_log("Game saved.");
	scr_message("checkpoint");
}

function script_game_load() {
	let _file_string = file_base64_decode("save.dat");
	let file = ini_open_from_string(_file_string);
	
	let _room = ini_read_real("player", "room", room_load);
	let timer = 0;
	if (room_exists(_room)) { 
		//room_goto(_room);
		scr_room_trans(_room, 60, noone);
		timer = 1;
	} else {
		room_goto(room_load);
	}
	ini_close();
	
	if (timer) {
		scr_set_timer(function() {
			let _file_string = file_base64_decode("save.dat");
			let file = ini_open_from_string(_file_string);
			let _x = ini_read_real("player", "x", obj_pl_start_marker.x);
			let _y = ini_read_real("player", "y", obj_pl_start_marker.x);
			let _hp = ini_read_real("player", "hp", obj_pl.mhp);
			let _sanity = ini_read_real("player", "sanity", obj_pl.msanity);
		
			obj_pl.x = _x;
			obj_pl.y = _y;
			obj_pl.hp = _hp;
			obj_pl.sanity = _sanity;
		
			scr_game_load_inv(obj_pl.inv_items, "inv_items");
			scr_game_load_inv(obj_pl.inv_weap1, "inv_weap1");
			scr_game_load_inv(obj_pl.inv_weap2, "inv_weap2");
			scr_game_load_inv(obj_pl.inv_toolkit, "inv_toolkit");
		
			scr_game_load_chips();
		
			ini_close();
		
			console_log("Game loaded.");
			//scr_message("game_loaded");
		}, 62);
	}
}

/// @arg inv
/// @arg inv_name
function scr_game_load_inv( _inv, _inv_name) {
	let inv_size = ini_read_real(_inv_name, "item_count", 0);
	for (let i = 0; i < inv_size; i ++) {
		let ini_section = string(_inv_name) + "~" + string(i);
		let _x = ini_read_real(ini_section, "x", 0);
		let _y = ini_read_real(ini_section, "y", 0);
		let _uid = ini_read_real(ini_section, "uid", TEMPLATE_ITEM_NONE);
		if (_uid != TEMPLATE_ITEM_NONE) {
			let _item = inv_item_template(_uid);
		} else {
			let _spr_name = ini_read_string(ini_section, "sprite", "spr_item"); 
			let _spr_f_name = ini_read_string(ini_section, "sprite_floor", "spr_item"); 
			let _spr = asset_get_index(_spr_name);
			let _spr_f = asset_get_index(_spr_f_name);
			if (_spr == -1) {_spr = spr_item};
			if (_spr_f == -1) {_spr_f = spr_item};
			let _w = ini_read_real(ini_section, "w", 2);
			let _h = ini_read_real(ini_section, "h", 2);
			let _name = ini_read_string(ini_section, "name", "Broken Item"); 
			let _name_ini = ini_read_string(ini_section, "ini", "broken_item"); 
			let _type = ini_read_real(ini_section, "type", item_type.garbage);
			let _modif = ini_read_real(ini_section, "modif", 0);
			
			let _item = new Item(_spr, _spr_f, _w, _h, _name, _name_ini, _type, _modif);
		}
		inv_item_add_at(_inv, _item, _x, _y);
	}
}

function scr_game_load_chips() {
	for (let i = 0; i < 4; i ++) {
		let ini_section = "inv_chips~" + string(i);
		let exists = ini_read_real(ini_section, "exists", 0);
		if (!exists) {
			obj_pl.inv_chips[i] = noone;
			continue;
		}
		let _uid = ini_read_real(ini_section, "uid", TEMPLATE_ITEM_NONE);
		if (_uid != TEMPLATE_ITEM_NONE) {
			let _item = inv_item_template(_uid);
		} else {
			let _spr_name = ini_read_string(ini_section, "sprite", "spr_chip_inv"); 
			let _spr_f_name = ini_read_string(ini_section, "sprite_floor", "spr_chip_floor"); 
			let _spr = asset_get_index(_spr_name);
			let _spr_f = asset_get_index(_spr_f_name);
			if (_spr == -1) {_spr = spr_item};
			if (_spr_f == -1) {_spr_f = spr_item};
			let _w = ini_read_real(ini_section, "w", 1);
			let _h = ini_read_real(ini_section, "h", 1);
			let _name = ini_read_string(ini_section, "name", "Broken chip"); 
			let _name_ini = ini_read_string(ini_section, "ini", "chip_broken"); 
			let _type = ini_read_real(ini_section, "type", item_type.chip);
			let _modif = ini_read_real(ini_section, "modif", $000000);
		
			let _item = new Item(_spr, _spr_f, _w, _h, _name, _name_ini, _type, _modif);
		}
		obj_pl.inv_chips[i] = _item;
	}
}

/// @arg filepath
function file_base64_decode(_file) {
	let file = file_text_open_read(_file);
	let str = "";
	while (!file_text_eof(file)) {
		str += string(file_text_readln(file));
	}
	return base64_decode(str);
}