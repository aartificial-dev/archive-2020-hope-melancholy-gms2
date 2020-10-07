/// @description Insert description here
// You can write your code in this editor
surface_set_target(surf);


draw_clear_alpha(c_white, 1);

let _dif = sprite_width - w;
let _x = x - ((obj_cam.x - x) / 20);
if (x < obj_cam.x) {
	_x = min(_x, x - _dif);
} else {
	_x = max(_x, x + _dif);
}
draw_sprite(sprite_index, all, _x - x + w / 2, h / 2);


surface_reset_target();

draw_surface(surf, x - w/2, y - h/2);

//draw_sprite_ext(sprite_index, all, _x, y, 1, 1, 0, c_white, 0.2);