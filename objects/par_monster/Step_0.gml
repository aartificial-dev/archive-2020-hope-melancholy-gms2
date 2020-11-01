/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


let im_index = animation_get_frame();
let im_max = animation_get_current_number();
let im_anim = animation_get_current_state();

hear_sound = signal_sound_hear(x, y - 30, 0.2, obj_pl);

let dis_player = distance_to_object(obj_pl);
let see_collision = collision_line(x, y - 30, obj_pl.x, obj_pl.y - 30, par_unwalk, 0, 1);
let see_player = !see_collision 
									&& ((dis_player < 160 && (dis_player < 5 || (spr_dir == sign(obj_pl.x - x)))) 
								  || hear_sound || state == AI_ALERT || state == AI_CHASE);


if (can_move) {
	// state machine
	switch (state) {
		case AI_IDLE:
			if (irandom(500) = 0) {
				wander_x = 	x + irandom_range(-60, 60);
				if (!collision_line(x, y - 30, wander_x, y - 30, par_wall, 0, 1)) {
					state = AI_WANDER;
				} else {
					wander_x = x;
				}
			}
			if (see_player) {state = AI_ALERT;}
		break;
		case AI_WANDER:
			let norm = sign(floor(abs(wander_x - x) / 2));
			if (norm == 0) {state = AI_IDLE;}
			if (see_player) {state = AI_ALERT;}
		break;
		case AI_ALERT:
			if (alarm[0] == -1) {state = AI_IDLE;}
			if (see_player) {state = AI_CHASE;}
			if (dis_player < 30) {state = AI_ATTACK;}
		break;
		case AI_CHASE: 
			if (!see_player) {state = AI_ALERT;}
			if (dis_player < 30) {state = AI_ATTACK;}
		break;
		case AI_ATTACK:
			if (!see_player || dis_player > 30) {state = AI_ALERT;}
		break;
		case AI_HURT: break;
		case AI_DIE: break;
		default:
			state = AI_IDLE;
		break;
	}
	
	if (see_player && global.r_trans_state <= 1) {
		alarm[0] += 3;
		alarm[0] = clamp(alarm[0], 0, 600);
		pl_last_x = obj_pl.x;
		pl_last_y = obj_pl.y;
		door_id = noone;
	}
	if (see_player && global.r_trans_state > 1 && obj_pl.last_used != noone && door_id == noone) {
		door_id = obj_pl.last_used;
		alarm[0] = 600;
	}
	
	if (state == AI_WANDER) {
		let norm = sign(floor(abs(wander_x - x) / 2));
		move = sign(wander_x - x) * norm;
	}
	if (state == AI_ALERT || state == AI_CHASE) {
		if (door_id == noone) {
			let norm = sign(floor(abs(pl_last_x - x) / 2));
			move = sign(pl_last_x - x) * norm;
		} else {
			let norm = sign(floor(abs(door_id.x - x) / 2));
			move = sign(door_id.x - x) * norm;
			if (instance_place(x, y, door_id)) {
				if (alarm[1] == -1) {
					alarm[1] = 120;
				}
				if (door_id.target_room == room && alarm[1] == 2 && door_id.opened == 1) {
					let marker = scr_get_marker_id(door_id.target);
					if (marker != noone) {
						marker.door.image_index = 1;
						marker.door.alarm[0] = 30;
						x = marker.x;
						y = marker.y;
						door_id = noone;
						pl_last_x = x;
						pl_last_y = y;
					}
				}
			}
		}
	}
	if (state == AI_ATTACK) {
		animation_play(ANIM_ATTACK_MELEE);
		if (ceil(im_index) == 3 && alarm[2] == 0) {
			alarm[2] = 15;
			// attack here;
		}
		move = 0;
		let tmove = -sign(obj_pl.x - x);
		spr_dir = -tmove;
		if (!place_meeting(x + tmove * mspd , y, par_unwalk) && dis_player < 20) {
			x += tmove * mspd;
		}
	} else if (move != 0) {
		animation_play(ANIM_WALK);
	} else {
		animation_play(ANIM_IDLE);
	}
}

if (is_hurt || state = AI_DIE) {
	spr_dir = -xmove;
	if (!place_meeting(x + xmove * 0.25, y, par_unwalk)) {
		x += xmove * 0.25;
	}
	can_move = 0;
	move = 0;
}
if (is_hurt) {
	animation_play(ANIM_HURT);
}
if (state = AI_DIE) {
	animation_play(ANIM_DIE);
	if (im_index > im_max - 0.5) {
		instance_destroy();
	}
}

animation_set_xscale(spr_dir);