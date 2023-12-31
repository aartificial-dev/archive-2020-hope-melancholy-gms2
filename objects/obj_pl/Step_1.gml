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
	if (on_ladder) {
		animation_play(ANIM_LADDER);
		if (!ladder_move) {
			animation_set_frame(ladder_im);
		}
	}
	if (!is_attack && !is_reload && !on_ladder) {
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
	if (is_hurt) {
		animation_play(ANIM_HURT);
	}
}

if (weap_current != "noone") {
	animation_bind(ANIM_IDLE           , spr_pl_idle_item   , 0.05);
	animation_bind(ANIM_WALK           , spr_pl_walk_item   , 0.05 * 2.5);
} else {
	animation_bind(ANIM_IDLE           , spr_pl_idle			  , 0.05);
	animation_bind(ANIM_WALK           , spr_pl_walk			  , 0.05 * 2.5);
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
		signal_sound_emit(x + (4 * spr_dir), y - 2, 30, obj_pl, 0.1, 8);
	}
} else {
	if (ladder_move && (floor(im_index) == 0 || floor(im_index) == 4) && alarm[9] == -1) {
		let foot = choose(snd_ladder_0, snd_ladder_1 , snd_ladder_2, snd_ladder_3);
		audio_play_sound(foot, 0, 0);
		alarm[9] = 25;
		signal_sound_emit(x, y - 24, 30, obj_pl, 0.1, 8);
	}
	if (is_smoke && floor(im_index = 6) && alarm[9] == -1) {
		if (spr_dir == 1) {
			effect_play(seq_smoke_right, x + 6, y - 39);
		} else {
			effect_play(seq_smoke_left, x - 6, y - 39);
		}
		alarm[9] = 20;
	} else {
		standing_time ++;
	}
}

if (standing_time > 300 && floor(im_index) == 0) {
	is_smoke = 1;
	standing_time = 0;
	alarm[8] = animation_get_length(ANIM_SMOKE);
}

if (is_attack || is_reload || move || v_spd != 0 || !can_move || is_hurt || weap_current != "noone") {
	is_smoke = 0;
	standing_time = 0;
}


// sanity stuff
obj_cam.chrom_add = 1;
if (instance_exists(par_monster)) {
	if (distance_to_object(par_monster) < 120) {
		sanity -= 0.05 * (1 - (distance_to_object(par_monster) / 120));
		obj_cam.chrom_add = 1 + (5 * (1 - (distance_to_object(par_monster) / 120)));
		if (!audio_is_playing(monster_sound)) {monster_sound = audio_play_sound(snd_monster_near, 0, 1);}
		audio_sound_gain(monster_sound, 1 - (distance_to_object(par_monster) / 120), 0);
	} else {audio_stop_sound(monster_sound);}
} else {audio_stop_sound(monster_sound);}

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

if (!instance_exists(cam)) {
	if (instance_exists(obj_cam)) {
		cam = instance_find(obj_cam, 0);
	} else {
		cam = instance_create_layer(x, y, Layers.system, obj_cam);
	}
	cam.target = id;
	cam.x = x;
	cam.y = y;
}