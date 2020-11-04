/// @description Load
// You can write your code in this editor
if (file_exists("save.dat")) {
	script_game_load();
	instance_destroy();
}