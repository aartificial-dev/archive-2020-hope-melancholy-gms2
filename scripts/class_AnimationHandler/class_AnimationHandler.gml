class AnimationHandler() constructor {
	state = noone;
	spr = ds_map_create();
	spd = ds_map_create();
	frame = 0;
	xscale = 1;
	yscale = 1;
	dir = 0;
	alpha = 1;
	
	destroy = function () {
		ds_map_destroy(spr);
		ds_map_destroy(spd);
	}
}