class AnimHandler() constructor {
	_sprites = ds_map_create();
	_speed = ds_map_create();
	_keys = ds_list_init();
	
	static step = function() {
		let l = ds_map_size(_sprites);
		for (let i = 0; i < l; i ++) {
			let key = _keys[| i];
			let subimg = _sprites[? key];
			let numb = sprite_get_number(asset_get_index(key)); 
			subimg += _speed[? key];
			if (subimg >= numb) {
				subimg -= numb;
			}
			_sprites[? key] = subimg;
		}
	}
	
	static add = function (spr, spd) {
		let key = sprite_get_name(spr);
		ds_map_add(_sprites, key, 0);
		ds_map_add(_speed, key, spd);
		ds_list_add(_keys, key);
		console_log("Added " + string(key) + " to handler");
	}
	
	static set = function (spr, subimg) {
		let key = sprite_get_name(spr);
		if (ds_list_find_index(_keys, key) == -1) {
			console_log("Cannot set Image for " + string(key));
			exit;
		}
		_sprites[? key] = subimg;
	}
	
	static setSpeed = function (spr, subimg) {
		let key = sprite_get_name(spr);
		if (ds_list_find_index(_keys, key) == -1) {
			console_log("Cannot set Speed for " + string(key));
			exit;
		}
		_speed[? key] = subimg;
	}
	
	static get = function(spr) {
		let key = sprite_get_name(spr);
		if (ds_list_find_index(_keys, key) == -1) {
			console_log("Cannot get Image for " + string(key));
			exit;
		}
		return _sprites[? key];
	}
	
	static remove  = function (spr) {
		let key = sprite_get_name(spr);
		if (ds_list_find_index(_keys, key) == -1) {
			console_log("Cannot find " + string(key));
			exit;
		}
		ds_map_delete(_sprites, key);
		ds_map_delete(_speed, key);
		let pos = ds_list_find_index(_keys, key);
		ds_list_delete(_keys, pos);
	}
	
	static destroy  = function () {
		ds_map_destroy(_sprites);
		ds_map_destroy(_speed);
		ds_list_purge(_keys);
	}
}