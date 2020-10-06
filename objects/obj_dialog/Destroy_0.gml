/// @description Insert description here
// You can write your code in this editor

if (script_exists(scene.endscript)) {
	script_execute(scene.endscript);
}

obj_cam.target = cam_target;
obj_cam.view_scale = 1;

let _sound = scene.sound[d_current];
audio_stop_sound(_sound);
