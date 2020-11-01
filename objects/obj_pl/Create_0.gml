/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (instance_exists(obj_pl) && instance_number(obj_pl) > 1) {instance_destroy();}
show_debug_message(" ");
mspd = 1;

cam = instance_create_layer(x, y, Layers.system, obj_cam);
cam.target = id;

interact = noone;

random_set_seed(current_time);
randomize();

a_handler = new AnimHandler();
a_handler.add(spr_hud_gear, 0.1);
a_handler.add(spr_hud_hand, 0.1);
a_handler.add(spr_hud_eye, 0.1);
a_handler.add(spr_hud_mouth, 0.1);

inv_create();
weap_select = 0;
weap_current = "noone";
hand_length = 25;

// weapons stuff
gun_ammo_inv = 15;
gun_ammo = 10;
gun_ammo_max = 10;
// pretty useless

animation_bind(ANIM_IDLE           , spr_pl_idle   , 0.05);
animation_bind(ANIM_WALK           , spr_pl_walk   , 0.05 * 2.5);
animation_bind(ANIM_FALL           , spr_pl_fall   , 0.05);
animation_bind(ANIM_HURT           , spr_pl_hit    , 0.05);
animation_bind(ANIM_DIE            , spr_pl_hit    , 0.05);
animation_bind(ANIM_WALL 					 , spr_pl_wall   , 0.05)
animation_bind(ANIM_SMOKE          , spr_pl_smoke  , 0.05 * 1.5);
animation_bind(ANIM_ATTACK_PUNCH   , spr_pl_punch  , 0.05 * 3);
animation_bind(ANIM_ATTACK_TUBE    , spr_pl_tube   , 0.05 * 3);
animation_bind(ANIM_ATTACK_FIREARM , spr_pl_shoot  , 0.05 * 8);
animation_bind(ANIM_FLASHLIGHT		 , spr_pl_shoot  , 0);
animation_bind(ANIM_RELOAD				 , spr_pl_reload , 0.05 * 1.25);
animation_play(ANIM_IDLE);

weap_ang = 0;

image_face_index = 0;
standing_time = 0;

sanity = 40;
msanity = sanity;
sanity_index = 0;

is_attack = 0;
is_smoke = 0;
is_reload = 0;

hp = 20;
mhp = 20;

hud_offset = 0;
hud_offset_m = 37;

last_used = noone;

flash_light = noone;