/// @description Insert description here
// You can write your code in this editor

spd = 0;
mspd = 1;
vel = 0.2;
move = 0;
v_vel = 0.2;
v_spd = 0;
v_mspd = 9;

hp = 10;
mhp = 10;

spr_dir = sign(image_xscale);
if (spr_dir = 0) {
	spr_dir = 1;
}

image_speed = 0.00;

animation_init();

//animation_speed = 0.05;

//entity_sprites_init(spr_pl_idle, animation_speed, spr_pl_walk, animation_speed, spr_pl_fall, animation_speed, spr_pl_hit, animation_speed, spr_pl_hit, animation_speed);


can_move = 1;

is_attack = 0;
is_hurt = 0;