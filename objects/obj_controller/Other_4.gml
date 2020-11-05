/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_pl) && room != room_menu && room != room_load) {
	if (instance_exists(obj_pl_start_marker)) {
		instance_create_layer(obj_pl_start_marker.x, obj_pl_start_marker.y, Layers.entity, obj_pl);
	} else {
		console_log("Nowhere to place player.");
		game_end();
	}
}

if (file_exists("save.dat")) {
	let version = string(GM_version);
	let _file_string = file_base64_decode("save.dat");
	ini_open_from_string(_file_string);
	let save_version = ini_read_string("game", "version", "0");
	ini_close();
	if (version != save_version) {
		file_delete("save.dat");
	}
}