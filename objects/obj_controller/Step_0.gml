/// @description Insert description here
// You can write your code in this editor

if (room == room_load) {
	room_goto(room_office);
	exit;
}

if (!instance_exists(obj_pl) && room != room_menu && room != room_load) {
	if (instance_exists(obj_pl_start_marker)) {
		instance_create_layer(obj_pl_start_marker.x, obj_pl_start_marker.y, Layers.entity, obj_pl);
	} else {
		console_log("Nowhere to place player.");
		game_end();
	}
}
