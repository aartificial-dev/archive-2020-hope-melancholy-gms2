/// @description New game
// You can write your code in this editor
if (file_exists("save.dat")) {
	file_delete("save.dat");
}

scr_room_trans(room_office, 60, noone);