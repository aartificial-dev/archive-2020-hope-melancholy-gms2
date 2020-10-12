if (instance_exists(light)) {
	instance_destroy(light);
audio_play_at(snd_electro_explode, x, y, 150, 1, 0, 0);
sprite_index = spr_lamppost_dark;
	effect_play(seq_sparks, x, y - 86);
}
