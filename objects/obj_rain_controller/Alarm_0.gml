/// @description Insert description here
// You can write your code in this editor

let amount = 3 * image_xscale;

for (let i = 0; i < amount; i ++) {
	_x = x + i * (32 / 3) + irandom_range(-8, 8);
	if (_x > view_x - 20 && _x < view_x + view_w + 20 && y < view_y + 40 && y > view_y - 40) {
		instance_create_layer(_x, y + 1 + irandom(4), Layers.effect, obj_raindrop);
	}
}

alarm[0] = 8;