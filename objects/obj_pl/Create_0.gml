/// @description Insert description here
// You can write your code in this editor
event_inherited();

mspd = 1.5;


cam = instance_create_layer(x, y, "L_System", obj_cam);
cam.target = id;

interact = noone;

random_set_seed(current_time);
randomize();

a_handler = new AnimHandler();
a_handler.add(spr_hud_gear, 0.1);
a_handler.add(spr_hud_hand, 0.1);
a_handler.add(spr_hud_eye, 0.1);



inv_create();
weap_select = 0;
weap_current = noone;
hand_length = 50;

// weapons stuff
gun_ammo_inv = 15;
gun_ammo = 10;
gun_ammo_max = 10;
gun_ammo_un = 1;

shot_ammo_inv = 2;
shot_ammo = 0;
shot_ammo_max = 4;
shot_ammo_un = 1;

rifle_ammo_inv = 8;
rifle_ammo = 0;
rifle_ammo_max = 25;
rifle_ammo_un = 1;

energy_ammo_inv = 0;
energy_ammo = 0;
energy_ammo_max = 7;
energy_ammo_un = 1;
// pretty useless

// add die event
entity_sprites_init(spr_pl_idle, animation_speed, spr_pl_walk, animation_speed * 2, spr_pl_fall, animation_speed, spr_pl_hit, animation_speed, spr_pl_hit, animation_speed);

is_smoke = 0;
is_attack = 0;
a_image_index = 0;

weap_ang = 0;

is_smoke = 0;
a_smoke_index = 0;
image_face_index = 0;
standing_time = 0;

sanity = 40;
msanity = sanity;
sanity_index = 0;

hp = 20;
mhp = 20;

hud_offset = 0;
hud_offset_m = 37;
