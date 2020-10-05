
enum cam_shake {
	left,
	right,
	both
}

function scr_camera_shake(type, amount, time) {
	obj_cam.shake_type = type;
	obj_cam.shake_amount = amount;
	obj_cam.alarm[1] = time;
}

#macro view_x (__template_cam_x())
#macro view_y (__template_cam_y())

#macro view_w (__template_cam_w())
#macro view_h (__template_cam_h())

function __template_cam_x() {
	let camera = view_camera[0];
	return (camera_get_view_x(camera));
}

function __template_cam_y() {
	let camera = view_camera[0];
	return (camera_get_view_y(camera));
}

function __template_cam_w() {
	let camera = view_camera[0];
	return (camera_get_view_width(camera));
}

function __template_cam_h() {
	let camera = view_camera[0];
	return (camera_get_view_height(camera));
}

#macro gui_mouse_x (__template_gui_x())
#macro gui_mouse_y (__template_gui_y())

#macro gui_w (__template_gui_w())
#macro gui_h (__template_gui_h())

function __template_gui_x() {
	return mouse_x - view_x;
}

function __template_gui_y() {
	return mouse_y - view_y;
}

function __template_gui_w() {
	return display_get_gui_width();
}

function __template_gui_h() {
	return display_get_gui_height();
}