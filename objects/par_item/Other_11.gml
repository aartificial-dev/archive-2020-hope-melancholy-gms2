/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

let comb = scr_items_combine(item, obj_pl.inv_hand);
if (comb != noone) {
	obj_pl.inv_hand = comb;
	instance_destroy();
}