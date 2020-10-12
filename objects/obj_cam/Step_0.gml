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

//camera_set_view_pos(camera, floor(x - (view_width / 2)), y);
camera_set_view_pos(camera, round(x - (view_w / 2)), round(y - (view_h / 2)));
camera_set_view_size(camera, view_width / actual_scale, view_height / actual_scale);

//window_mouse_set(clamp(window_mouse_get_x(),0,window_get_width()),clamp(window_mouse_get_y(),0,window_get_height()));

if (mouse_check_button_pressed(mb_left)) {
//	effect_play(seq_sparks, mouse_x, mouse_y);
}