/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

animation_bind(ANIM_IDLE           , spr_monster_idle   , 0.05);
animation_bind(ANIM_WALK           , spr_monster_walk   , 0.05 * 2.5);
animation_bind(ANIM_DIE            , spr_monster_die    , 0.05 * 2);
animation_bind(ANIM_ATTACK_MELEE   , spr_monster_attack , 0.05 * 3);
animation_bind(ANIM_HURT           , spr_monster_hurt   , 0.05 * 2)
animation_play(ANIM_IDLE);

xmove = 0;
state = AI_IDLE;
prevstate = AI_IDLE;

pl_last_x = x;
pl_last_y = y;
wander_x = x;
door_id = noone;

mspd = 0.8;


