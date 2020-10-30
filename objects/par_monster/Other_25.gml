/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp -= hit_object_dmod; 
if (hp <= 0) {
	animation_play(ANIM_DIE);
	state = AI_DIE;
	is_hurt = 0;
	can_move = 0;
	alarm[11] = 0;
} else {
	animation_play(ANIM_HURT);
	state = AI_HURT;
}
xmove = sign(x - hit_object_x);
if (xmove == 0) {
	xmove = 1;
}