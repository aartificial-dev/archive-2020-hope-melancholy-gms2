/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

	// blue - $FFE8CC
	// red - $A4A4CD
	// green - $A7D1B2
let col = choose($FFE8CC, $A4A4CD, $A7D1B2);
let spr, tag, ini;
if (col == $FFE8CC) {
	spr = spr_chip_inv_b;
	tag = "Speed Chip";
	ini = "chip_speed";
}
if (col == $A4A4CD) {
	spr = spr_chip_inv_r;
	tag = "Power Chip";
	ini = "chip_power";
}
if (col == $A7D1B2) {
	spr = spr_chip_inv_g;
	tag = "Smart Chip";
	ini = "chip_smart";
}

item = new Item(spr, spr_chip_floor, 1, 1, tag, ini, item_type.chip, col);

