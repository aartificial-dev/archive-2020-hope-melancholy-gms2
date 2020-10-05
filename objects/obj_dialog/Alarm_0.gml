/// @description Destroy

instance_destroy();

obj_cam.target = cam_target;
obj_cam.view_scale = 1;

let _sound = scene.sound[d_current];
audio_stop_sound(_sound);