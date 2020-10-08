scr_trigger_init(function() {
	
	scr_set_timer(function() {
		instance_destroy(obj_monster);
		instance_create_layer(1280, 160, Layers.entity, obj_monster);
		
		scr_set_timer(function () {
			game_end();
		}, 90);
		
	}, 120);
	
	audio_play_sound(snd_horror_woop, 0, 0);
	instance_create_layer(1184, 160, Layers.entity, obj_monster);
	instance_create_layer(1184, 160, Layers.entity, obj_horror);
	
}, noone, 1);
