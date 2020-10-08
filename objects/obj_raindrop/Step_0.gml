
y += lendir_y(spd, 0, image_angle);
x += lendir_x(spd, 0, image_angle);
if (collision_point(x, y + 4, par_collision, 0, 1)) {
	instance_create_layer(x, y + 1, Layers.effect, obj_rain_splash);
	instance_destroy();
}