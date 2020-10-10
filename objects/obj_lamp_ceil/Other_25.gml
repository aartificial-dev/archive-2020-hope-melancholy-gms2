/// @description Hit
// You can write your code in this editor
if (instance_exists(light)) {
	instance_destroy(light);

	audio_play_at(snd_electro_explode, x, y, 150, 1, 0, 0);
	sprite_index = spr_lamp_ceil_dark;
	instance_create_layer(x, y + 4, Layers.effect, obj_sparks);
}