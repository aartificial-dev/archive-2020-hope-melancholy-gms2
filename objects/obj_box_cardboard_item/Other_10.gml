/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (item) {
	scr_item_summon(item, x, y - 20);
	item = noone;
}
/// sound
audio_play_at(snd_cardboard_open, x, y, 150, 1, 0, 0);
let ins = instance_create_layer(x, y, Layers.furniture, obj_box_cardboard_empty);
ins.image_index = image_index;
ins.image_speed = 0;
instance_destroy();
