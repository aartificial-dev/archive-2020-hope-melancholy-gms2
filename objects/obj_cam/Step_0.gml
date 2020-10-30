/// @description Insert description here
// You can write your code in this editor
let camera = view_camera[0];

if (instance_exists(target)) {
	let _h = ( view_h / 2) * 0.75;
	x = lerp(x, target.xprevious, 0.05);
	x = lerp(x, mouse_x, 0.005);
	x = clamp(x, 0 +  (view_w / 2), room_width -  (view_w / 2));
	y = target.y - _h;
	y = clamp(y, 0 +  (view_h / 2), room_height -  (view_h / 2));

	if (shake_amount) {
		switch (shake_type) {
			case cam_shake.left: 
				x -= shake_amount;
			break;
			case cam_shake.right:
				x += shake_amount;
			break;
			case cam_shake.both:
				x += sin(current_time/10) * shake_amount;
			break;
		}
	}	
}

actual_scale = lerp(actual_scale, view_scale, 0.15);

if (keyboard_check_pressed(vk_up)) {
	view_scale += 0.1;
}
if (keyboard_check_pressed(vk_down)) {
	view_scale -= 0.1;
}
if (keyboard_check_pressed(vk_right)) {
	view_scale = 1;
}
view_scale = clamp(view_scale, 0.1, 2)
camera_set_view_pos(camera, round(x - (view_w / 2)), round(y - (view_h / 2)));
camera_set_view_size(camera, view_width / actual_scale, view_height / actual_scale);

if (keyboard_check_pressed(vk_escape) && !instance_exists(par_gui_menu)) {
	if (instance_exists(obj_game_menu)) {
		instance_destroy(obj_game_menu);
	} else {
		instance_create_layer(0, 0, Layers.system, obj_game_menu);
	}
	menu_opened = 1 - menu_opened;
}

if (!menu_opened) {
	blur_size = clamp(blur_size - 3, 0, blur_size_m);
} else {
	blur_size = clamp(blur_size + 3, 0, blur_size_m);
}