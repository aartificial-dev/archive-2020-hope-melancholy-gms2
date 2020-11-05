/// @func Item
/// @arg sprite
/// @arg sprite_floor
/// @arg width
/// @arg height
/// @arg name
/// @arg ini_name
/// @arg type
/// @arg modif
/// @arg UID
class Item(_sprite, _fsprite, _w, _h, _name, _ini, _type, _modif, _uid) constructor {
	sprite = _sprite;
	sprite_floor = _fsprite;
	w = _w;
	h = _h;
	name = _name;
	ini = _ini;
	type = _type;
	modif = _modif;
	uid = _uid;
	
	save = function() {
		let _str = "";
		_str += "sprite = \"" + string(sprite_get_name(sprite)) + "\"\n";
		_str += "sprite_floor = \"" + string(sprite_get_name(sprite_floor)) + "\"\n";
		_str += "w = " + string(w) + "\n";
		_str += "h = " + string(h) + "\n";
		_str += "name = \"" + string(name) + "\"\n";
		_str += "ini = \"" + string(ini) + "\"\n";
		_str += "type = " + string(type) + "\n";
		_str += "modif = " + string(modif) + "\n";
		_str += "uid = " + string(uid);
		return _str;
	}
}
