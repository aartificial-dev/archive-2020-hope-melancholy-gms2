/// @description Insert description here
// You can write your code in this editor


if (checked == 0) {
	let list = ds_list_create();
	for (let i = 0; i < dist; i ++) {
		let xc = x + lendir_x(i, 0, dir + d);
		let yc  = y + lendir_y(i, 0, dir + d);
		let num = collision_point_list(xc, yc, par_collision, 0, 1, list, 0);
		
		for (let j = 0; j < num; j ++) {
			if (instance_exists(list[| j]) && !obj_is_ancestor(list[| j], par_obsticle)) {
				dist = i;
				if (obj_is_ancestor(list[| j], par_unwalk)) {
					type = 0;
				}
				if (obj_is_ancestor(list[| j], par_entity)) {
					type = 1;
				}
				if (obj_is_ancestor(list[| j], par_monster)) {
					type = 2;
				}
				with (list[| j]) {
					hit_object_x = xc; 
					hit_object_y = yc;
					hit_object_dmod = 3;
					event_user(15);
				}
				//let splash = instance_create_layer(xc, yc, Layers.effect, obj_splash);
			}
		}
		ds_list_clear(list);
	}
	checked = 1;
	ds_list_destroy(list);
}

draw_set_alpha(0.3);
let i = (dist) * (1 - alarm[0] / 4);
let xfr = x + lendir_x(i, 0, dir + d);
let yfr = y + lendir_y(i, 0, dir + d);
let xto = x + lendir_x(dist, 0, dir + d);
let yto = y + lendir_y(dist, 0, dir + d);

draw_line_width_color(xfr, yfr, xto, yto, 2, c_yellow, c_yellow);
draw_set_alpha(1);