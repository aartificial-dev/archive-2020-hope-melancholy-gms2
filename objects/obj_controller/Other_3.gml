/// @description Insert description here
// You can write your code in this editor
	show_debug_message("-----------------------------------------------");
	let log = "Instances: \n" + 
						"obj_cam              " + string(instance_exists(obj_cam) ? "x: " + string(obj_cam.x) + "| y: " + string(obj_cam.y) : "") + "\n" +
						"obj_pl               " + string(instance_exists(obj_pl) ? "x: " + string(obj_pl.x) + "| y: " + string(obj_pl.y) : "") + "\n" +
						"obj_signal_handler   " + string(instance_exists(obj_signal_handler) ? "true" : "") + "\n" +
						"obj_light_system     " + string(instance_exists(obj_light_system) ? "true" : "") + "\n" +
						"obj_sequence_handler " + string(instance_exists(obj_sequence_handler) ? "true" : "") + "\n" +
						"Current Room: " + string(room_get_name(room));
	show_debug_message(log);
	show_debug_message("-----------------------------------------------");