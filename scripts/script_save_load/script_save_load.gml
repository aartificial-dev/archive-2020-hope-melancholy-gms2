function script_game_save() {
	let current_room = room;
	let player_x = obj_pl.x;
	let player_y = obj_pl.y;
	// save player stats
	// items ds
	// ds_list_write();
	// ds_map_write();
	// save inventory items
	// save inventory order
	// save structure 
	let save = "";
	save = base64_encode(save);
	let file = file_text_open_write("save.dat");
	file_text_write_string(file, save);
	
	file_text_close(file);
}

function script_game_load() {
	// read
	// ds_list_read();
	let file = file_text_open_read("save.dat");
	let save = file_text_readln(file);
	
	file_text_close(file);
}