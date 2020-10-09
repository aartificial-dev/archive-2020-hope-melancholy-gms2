/// @description Insert description here
// You can write your code in this editor

if (!instance_place(x + vel, y - 1, par_collision)) {
	x += vel;
} else {
	vel = 0;
}

vel /= 1.2;
