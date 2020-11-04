/// @description Insert description here
// You can write your code in this editor



if (!collision_point(x, y + vel, par_unwalk, 0, 1)) {
	y += vel;
	vel += 0.7;
} else if (!collision_point(x, y + 0.5, par_unwalk, 0, 1)){
	y += 0.5;
}
