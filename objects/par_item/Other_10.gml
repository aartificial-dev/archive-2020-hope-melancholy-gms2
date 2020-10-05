/// @description use event (pickup)

// Inherit the parent event
event_inherited();


if (item.type == item_type.ammo) {
	switch(item.name) {
		case "Pistol Ammo": {
			obj_pl.gun_ammo_inv += obj_pl.gun_ammo_max;
		} break;
		case "Shotgun Shells": {
			obj_pl.shot_ammo_inv += obj_pl.shot_ammo_max;
		} break;
		case "Rifle Mag": {
			obj_pl.rifle_ammo_inv += obj_pl.rifle_ammo_max;
		} break;
		case "Fusion Cell": {
			obj_pl.energy_ammo_inv += obj_pl.energy_ammo_max;
		} break;
	}
	audio_play_sound(snd_inv_pickup, 0, 0);
} else {
	inv_pickup(item);
}
instance_destroy();