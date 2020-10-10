if (instance_exists(light)) {
	instance_destroy(light);

audio_play_at(snd_electro_explode, x, y, 150, 1, 0, 0);
sprite_index = spr_lamppost_dark;
	instance_create_layer(x, y - 86, Layers.effect, obj_sparks);
}