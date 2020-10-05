/// @description Animations

if (anim_state == AnimState.custom && !is_smoke) {
	if (a_image_index > 0) {
			if (weap_current == "Firearm") {
				a_image_index += animation_speed * 8;
				if (a_image_index >= 7) {
					a_image_index = 0;
					is_attack = 0;
				}
			} else {
				a_image_index += animation_speed * 3;
				if (ceil(a_image_index) == 3) {
					/// BEAT HERE
					if (weap_current == "Tube") {
						scr_attack_swoosh(x, y - 24);
					} else {
						scr_attack_punch(x, y - 24);
					}
				}
				if (a_image_index >= 5) {
					a_image_index = 0; 
					is_attack = 0;
				}
			}
	}
}

if (move != 0) {
	is_smoke = 0;
	standing_time = 0;
	if ((floor(anim_index) == 4 || floor(anim_index) == 0) && alarm[9] == -1 && spd = mspd) {
		let foot = choose(snd_foot_1, snd_foot_2 , snd_foot_3, snd_foot_4);
		audio_play_sound(foot, 0, 0);
		alarm[9] = 14;
	}
} else {
	standing_time ++;
}

// smoking
if (is_smoke == 0) {
	a_smoke_index = 0;
} else {
	anim_index = 0;
}

if (standing_time > 300 && floor(anim_index) == 0) {
	is_smoke = 1;
	anim_state = AnimState.custom;
	a_smoke_index += animation_speed;
	if (a_smoke_index >= 10) {
		a_smoke_index = 0;
		standing_time = 0;
		is_smoke = 0;
	}
}

// sanity stuff
if (instance_exists(par_monster)) {
	if (distance_to_object(par_monster) < 30) {
		sanity -= 0.01;
	}
}

image_face_index += 1/60;
if (image_face_index >= 4) {
	image_face_index = 0;
}

sanity = clamp(sanity, 0, msanity);
sanity_index = 1 - (sanity / msanity);
s_anim_idle_spd = (animation_speed + (sanity_index * 0.01));
if (sanity < 30) {
	standing_time = 0;
	is_smoke = 0;
	if (!audio_is_playing(snd_pl_breath)) {
		audio_play_sound(snd_pl_breath, 0, 1);
	}
	audio_sound_gain(snd_pl_breath, sanity_index, 0);
} else {
	if (audio_is_playing(snd_pl_breath)) {
		audio_stop_sound(snd_pl_breath);
	}
}

// sound
audio_listener_position(x, y, 0);
audio_listener_orientation(0, 0, 1000, 0, -1, 0);

/*
	if (have_gun) {
		image_taunt_index += animation_speed * 8;
		//if (image_taunt_index >= 7) {
		//	is_attack = 0;
		//	image_taunt_index = 0;
		//}
	}
	if (!have_gun) {
		image_taunt_index += animation_speed * 3;
		
		if (have_tube) {
		if (ceil(image_taunt_index) == 3 && !instance_exists(obj_swoosh)) {
			let swoosh = instance_create_layer(x + (21 * image_direction), y - 5, "L_Entities", obj_swoosh);
			swoosh.creator = self.id;
		}
	}
	if (!have_gun && !have_tube) {
		if (ceil(image_taunt_index) == 3 && !instance_exists(obj_punch)) {
			let punch = instance_create_layer(x + (15 * image_direction), y - 5, "L_Entities", obj_punch);
			punch.creator = self.id;
		}
		
		
	image_walk_index += animation_speed * 2;
	if ((floor(image_walk_index) == 4 || floor(image_walk_index) == 0) && alarm[10] == -1 && spd = mspd) {
		let foot = choose(snd_foot_1, snd_foot_2 , snd_foot_3, snd_foot_4);
		audio_play_sound(foot, 0, 0);
		alarm[10] = 12;
	}
	
	
	if (standing_time > 240 && floor(image_idle_index) == 0) {
	image_smoke_index += animation_speed;
	if (image_smoke_index >= 10) {
		image_smoke_index = 0;
		standing_time = 0;
	}
} else {
	image_idle_index += animation_speed + (sanity_index * 0.01);
}

animation_speed = 0.05;

spd/vel = 1, 0.05