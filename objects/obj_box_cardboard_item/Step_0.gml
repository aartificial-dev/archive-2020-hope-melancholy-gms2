/// @description Insert description here
// You can write your code in this editor
if (item == noone) {
	let ins = instance_create_layer(x, y, Layers.furniture, obj_box_cardboard_empty);
	ins.image_index = image_index;
	ins.image_speed = 0;
	instance_destroy();
}