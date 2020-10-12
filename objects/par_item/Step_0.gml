/// @description Insert description here

if (item != noone) {
	name = ini_open_read("items", "DEFAULT", item.ini);
	sprite_index = item.sprite_floor;
}

let item_meet = instance_place(x, y + yvel, par_item);
let check = item_meet ? (y >= item_meet.y) : 1;
if (!place_meeting(x, y + yvel, par_obsticle) && !place_meeting(x, y + yvel, par_unwalk) && check) {
	y += yvel;
	yvel += 0.2;
	yvel = min(yvel, 1);
}
