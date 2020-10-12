/// @description Insert description here
// You can write your code in this editor

if (image_index == 0) {
	audio_play_at(snd_wood_door_open, x, y, 150, 1, 0, 0);
	if (obj_pl.x > x) {
		image_index = 1;
	} else {
		image_index = 2;
	}
	instance_destroy(collide);
} else {
	if (collision_rectangle(x - 4, y - 24, x + 4, y + 24, obj_pl, 0, 1)) {
		scr_message("door_in_way");
	} else {
		audio_play_at(snd_wood_door_close, x, y, 150, 1, 0, 0);
		image_index = 0;
		collide = instance_create_layer(x, y, Layers.collision, obj_unwalk_door);
	}
}