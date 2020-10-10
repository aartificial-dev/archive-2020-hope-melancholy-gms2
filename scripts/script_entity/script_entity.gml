// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @func scr_attack_swoosh
/// @arg x
/// @arg y
function scr_attack_swoosh(_x, _y) {
	if (!instance_exists(obj_swoosh)) {
		let swoosh = instance_create_layer(_x + (21 * spr_dir), _y - 5, Layers.entity, obj_swoosh);
		swoosh.creator = id;
		swoosh.stx = _x;
		swoosh.sty = _y;
	}
}

/// @func scr_attack_punch
/// @arg x
/// @arg y
function scr_attack_punch(_x, _y) {
	if (!instance_exists(obj_punch)) {
		let punch = instance_create_layer(_x + (15 * spr_dir), _y - 5, Layers.entity, obj_punch);
		punch.creator = id;
		punch.stx = _x;
		punch.sty = _y;
	}
}

/// @func scr_attack_shoot
function scr_attack_shoot() {
	if (gun_ammo <= 0) {
		a_image_index = 0;
		is_attack = 0;
		audio_play_sound(snd_pistol_ofa, 0, 0);
		if (alarm[10] == -1) {
			scr_message("Out of ammo", id);
			alarm[10] = 15;
		}
		exit;
	}
	let _x = x + ((- 4) * spr_dir);
	let _y = y - 7 - 24;
	let dir = weap_ang;
	let _flip; if (dir > 90 && dir < 270) {_flip = 3;} else {_flip = -3;}
	let len_x = _x + lendir_x(20, _flip, dir);
	let len_y = _y + lendir_y(20, _flip, dir);

	let sleeve = instance_create_layer(len_x, len_y, Layers.furniture, obj_sleeve);
	sleeve.dir = -spr_dir;

	let bullet = instance_create_layer(len_x, len_y, Layers.furniture, obj_bullet);
	bullet.dir = dir;
	
	let flash = instance_create_layer(len_x, len_y, Layers.furniture, obj_muzzleflash);
	flash.dir = dir;

	let sound = choose(snd_pistol_shot_1, snd_pistol_shot_2, snd_pistol_shot_3);
	audio_play_sound(sound, 0, 0);

	if (spr_dir = 1) {
		scr_camera_shake(cam_shake.left, 4, 3);
	} else {
		scr_camera_shake(cam_shake.right, 4, 3);
	}
	gun_ammo--;
}