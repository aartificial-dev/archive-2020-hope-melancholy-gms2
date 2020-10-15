/// @description Animations
event_inherited();

let animstate = animation_get_current_state();

if (!can_move) {
	animation_play(ANIM_IDLE);
}

if (move != 0 || v_spd != 0) {
	if (spd != 0 && v_spd == 0) {
		animation_play(ANIM_WALK);
	} else 
	if (ceil(spd) == 0 && v_spd == 0) {
		animation_play(ANIM_WALL);
	} else
	if (v_spd != 0) {
		animation_play(ANIM_FALL);
	}
} else if (can_move) {
	if (!is_attack && !is_reload) {
		if (!keyboard_check(vk_shift)) {
			if (!is_smoke) {
				animation_play(ANIM_IDLE);
			} 
			if (is_smoke) {
				animation_play(ANIM_SMOKE);
			}
		} 
		if (keyboard_check(vk_shift)) {
			let state = scr_pl_weapon_state(weap_current);
			animation_play(state);
			animation_set_frame(0);
		}
	} 
	if (is_reload) {
		animation_play(ANIM_RELOAD);
	}
	if (is_attack) {
		let state = scr_pl_weapon_state(weap_current);
		animation_play(state);
	}
}
animation_set_xscale(spr_dir);

let im_index = animation_get_frame();
if (move != 0) {
	is_smoke = 0;
	standing_time = 0;
	if ((floor(im_index) == 4 || floor(im_index) == 0) && alarm[9] == -1 && spd == mspd) {
		let foot = choose(snd_foot_1, snd_foot_2 , snd_foot_3, snd_foot_4);
		audio_play_sound(foot, 0, 0);
		alarm[9] = 14;
	}
} else {
	standing_time ++;
}

if (standing_time > 300 && floor(im_index) == 0) {
	is_smoke = 1;
	standing_time = 0;
	alarm[8] = animation_get_length(ANIM_SMOKE);
}

if (is_attack || is_reload || move || v_spd != 0) {
	is_smoke = 0;
	standing_time = 0;
}

/// add smoke here

/*
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
*/

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
//s_anim_idle_spd = (0.05 + (sanity_index * 0.01));
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
