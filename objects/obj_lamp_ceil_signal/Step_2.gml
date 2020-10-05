/// @description Insert description here
// You can write your code in this editor

if (signal_get(signal) == true && sprite_index != spr_lamp_ceil_dark && !instance_exists(light)) {
	light = instance_create_layer(x, y, Layers.light, par_light_ceil);
}
if (signal_get(signal) == false) {
	if (instance_exists(light)) {
		instance_destroy(light);
	}
}

if (signal_get(o_signal) == true) {
	if (instance_exists(light)) {
		instance_destroy(light);
	}

	//audio_play_at(snd_electro_explode, x, y, 150, 1, 0, 0);
	sprite_index = spr_lamp_ceil_dark;
}