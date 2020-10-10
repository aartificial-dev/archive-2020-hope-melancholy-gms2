/// @description Insert description here
// You can write your code in this editor

let xto = x + lendir_x(dist, 0, dir + d);
let yto = y + lendir_y(dist, 0, dir + d);

if (type == 0) {
	repeat(10) {
		let part = instance_create_layer(xto, yto, Layers.effect, obj_part_smoke);
		part.image_angle = (dir + d) - 180 + irandom_range(-30, 30);
		part.spd = random(2);
		part.image_xscale = 0.1 + random_range(-0.05, 0.05);
		part.image_yscale = part.image_xscale;
	}
}
if (type == 1) {
	// blood
	repeat(10) {
		let part = instance_create_layer(xto, yto, Layers.effect, obj_part_blood);
		part.image_angle = (dir + d) - 180 + irandom_range(-30, 30);
		part.spd = random(1);
		part.image_xscale = 0.1 + random_range(-0.05, 0.05);
		part.image_yscale = part.image_xscale;
	}
}
if (type == 2) {
	// black
	repeat(10) {
		let part = instance_create_layer(xto, yto, Layers.effect, obj_part_black);
		part.image_angle = (dir + d) - 180 + irandom_range(-30, 30);
		part.spd = random(1);
		part.image_xscale = 0.1 + random_range(-0.05, 0.05);
		part.image_yscale = part.image_xscale;
	}
}