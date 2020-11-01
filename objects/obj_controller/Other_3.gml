/// @description Insert description here
// You can write your code in this editor
	show_debug_message("-----------------------------------------------");
	let log = "Instances: \n" + 
						"obj_cam              " + string(instance_exists(obj_cam) ? "true" : "false") + "\n" +
						"obj_pl               " + string(instance_exists(obj_pl) ? "true" : "false") + "\n" +
						"obj_signal_handler   " + string(instance_exists(obj_signal_handler) ? "true" : "false") + "\n" +
						"obj_light_system     " + string(instance_exists(obj_light_system) ? "true" : "false") + "\n" +
						"obj_sequence_handler " + string(instance_exists(obj_sequence_handler) ? "true" : "false") + "\n" +
						"Current Room: " + string(room_get_name(room));
	show_debug_message(log);
	show_debug_message("-----------------------------------------------");